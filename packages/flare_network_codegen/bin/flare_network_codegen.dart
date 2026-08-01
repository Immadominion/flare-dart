import 'dart:io';

import 'package:args/args.dart';
import 'package:flare_network_codegen/src/generator.dart';
import 'package:flare_network_codegen/src/registry_names.dart';
import 'package:path/path.dart' as p;

/// Generates typed Dart bindings from Flare's published periphery ABI
/// artifacts.
///
/// This is a **standalone CLI, run manually**, not a `build_runner` builder.
/// Generated output is committed to the repository, so consumers of
/// `flare_network` get plain `.dart` files with no codegen dependency and no
/// build step of their own.
///
///     dart run flare_network_codegen \
///       --artifacts ../../reference/package \
///       --network coston2 \
///       --out ../flare_network_periphery/lib
Future<int> main(List<String> args) async {
  final parser =
      ArgParser()
        ..addOption(
          'artifacts',
          abbr: 'a',
          help:
              'Root of the extracted flare-periphery-contract-artifacts '
              'package (the directory containing flare/, coston2/, dist/).',
        )
        ..addOption(
          'network',
          abbr: 'n',
          defaultsTo: 'flare',
          allowed: ['flare', 'coston2', 'songbird', 'coston'],
          help:
              'Which ABI tree to read. Flare and Coston2 are byte-identical, '
              'as are Songbird and Coston.',
        )
        ..addOption(
          'out',
          abbr: 'o',
          help: 'Output directory for generated Dart.',
        )
        ..addMultiOption(
          'only',
          help:
              'Generate only these contracts. Repeatable. '
              'Defaults to every contract in the tree.',
        )
        ..addFlag(
          'dry-run',
          negatable: false,
          help: 'Report what would be written, write nothing.',
        )
        ..addFlag('help', abbr: 'h', negatable: false);

  final ArgResults opts;
  try {
    opts = parser.parse(args);
  } on FormatException catch (e) {
    stderr.writeln('${e.message}\n\n${parser.usage}');
    return 64;
  }

  if (opts['help'] as bool || opts['artifacts'] == null) {
    stdout.writeln('Generate typed Dart bindings from Flare ABI artifacts.\n');
    stdout.writeln(parser.usage);
    return opts['help'] as bool ? 0 : 64;
  }

  final artifactsRoot = Directory(opts['artifacts'] as String);
  if (!artifactsRoot.existsSync()) {
    stderr.writeln('Artifacts directory not found: ${artifactsRoot.path}');
    return 66;
  }

  final network = opts['network'] as String;
  final contractsDir = Directory(
    p.join(artifactsRoot.path, network, 'artifacts', 'contracts'),
  );
  if (!contractsDir.existsSync()) {
    stderr.writeln(
      'No contracts for network "$network" at '
      '${contractsDir.path}',
    );
    return 66;
  }

  final version = _readArtifactVersion(artifactsRoot) ?? 'unknown';
  final only = (opts['only'] as List<String>).toSet();
  final dryRun = opts['dry-run'] as bool;

  // Interface names are NOT registry names, so the mapping is read from the
  // artifacts' own products map. Without it every generated resolve() would
  // default to the interface name and throw.
  final registryNames = RegistryNames.load(artifactsRoot);
  final generator = BindingGenerator(
    artifactVersion: version,
    registryNames: registryNames,
  );
  final bindings = <GeneratedBinding>[];
  final skipped = <String, String>{};

  final files =
      contractsDir
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.json'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

  for (final file in files) {
    final contractName = p.basenameWithoutExtension(file.path);
    if (only.isNotEmpty && !only.contains(contractName)) continue;

    try {
      final abi = parseArtifact(file.readAsStringSync());
      final binding = generator.generate(contractName, abi);
      if (binding == null) {
        skipped[contractName] = 'nothing readable';
        continue;
      }
      bindings.add(binding);
    } catch (e) {
      // One unmappable contract must not abort the whole run: report it and
      // carry on, so the gap is visible rather than fatal.
      skipped[contractName] = '$e';
    }
  }

  stdout
    ..writeln('Artifacts : ${artifactsRoot.path} (v$version)')
    ..writeln('Network   : $network')
    ..writeln('Scanned   : ${files.length} artifact file(s)')
    ..writeln(
      'Generated : ${bindings.length} binding(s), '
      '${bindings.fold<int>(0, (n, b) => n + b.methodCount)} read method(s)',
    )
    ..writeln('Skipped   : ${skipped.length}');

  if (skipped.isNotEmpty) {
    // Never let a partial run look complete.
    stdout.writeln('\nSkipped contracts:');
    for (final entry in skipped.entries.take(20)) {
      stdout.writeln('  ${entry.key}: ${entry.value}');
    }
    if (skipped.length > 20) {
      stdout.writeln('  ... and ${skipped.length - 20} more');
    }
  }

  if (dryRun) {
    stdout.writeln('\nDry run — nothing written.');
    return 0;
  }

  final outRoot = opts['out'] as String?;
  if (outRoot == null) {
    stderr.writeln('\n--out is required unless --dry-run is passed.');
    return 64;
  }

  final srcDir = Directory(p.join(outRoot, 'src'))..createSync(recursive: true);
  for (final binding in bindings) {
    File(
      p.join(srcDir.path, binding.fileName),
    ).writeAsStringSync(binding.source);
  }
  File(
    p.join(outRoot, 'flare_network_periphery.dart'),
  ).writeAsStringSync(generator.generateBarrel(bindings));

  stdout.writeln('\nWrote ${bindings.length + 1} file(s) to $outRoot');
  return 0;
}

String? _readArtifactVersion(Directory root) {
  final pkg = File(p.join(root.path, 'package.json'));
  if (!pkg.existsSync()) return null;
  final match = RegExp(
    r'"version"\s*:\s*"([^"]+)"',
  ).firstMatch(pkg.readAsStringSync());
  return match?.group(1);
}
