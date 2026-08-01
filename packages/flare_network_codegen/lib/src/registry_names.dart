import 'dart:io';

import 'package:path/path.dart' as p;

/// Maps a Solidity interface name to the name it is registered under in the
/// Flare Contract Registry.
///
/// These are different, and assuming otherwise silently breaks every generated
/// `resolve()`. `IFtsoV2` is registered as `FtsoV2`; `IAssetManager` is
/// registered as `AssetManagerFXRP`. Measured against a live
/// `getAllContracts()` on Coston2: of 142 interface names, **zero** appear in
/// the registry's 69 entries.
///
/// The mapping is published in the artifacts package's own `dist/index.js`, in
/// a per-network `products` map whose entries carry both `interface` and
/// `registry`. That file is compiled JavaScript rather than JSON, so it is
/// parsed textually — the alternative is shelling out to Node, which this tool
/// deliberately avoids.
class RegistryNames {
  /// Interface name to registry name, e.g. `IFtsoV2` to `FtsoV2`.
  final Map<String, String> interfaceToRegistry;

  const RegistryNames(this.interfaceToRegistry);

  /// An empty mapping, for when `dist/index.js` cannot be found.
  static const empty = RegistryNames({});

  /// The registry name for [interfaceName], or null if it is not registered.
  ///
  /// A null result means the contract is not resolvable by name at all — many
  /// of Flare's published interfaces are internal (`II*`) or are reached
  /// through another contract rather than the registry.
  String? operator [](String interfaceName) =>
      interfaceToRegistry[interfaceName];

  /// How many interfaces are registry-resolvable.
  int get length => interfaceToRegistry.length;

  /// Loads the mapping from an extracted artifacts package.
  ///
  /// [artifactsRoot] is the directory containing `dist/`. Returns [empty] if
  /// the file is missing, so generation degrades to requiring an explicit
  /// registry name rather than failing outright.
  factory RegistryNames.load(Directory artifactsRoot) {
    final file = File(p.join(artifactsRoot.path, 'dist', 'index.js'));
    if (!file.existsSync()) return empty;
    return RegistryNames.parse(file.readAsStringSync());
  }

  /// Parses the `products` entries out of `dist/index.js`.
  ///
  /// Entries look like:
  /// ```js
  ///     FtsoV2: {
  ///         name: "FtsoV2",
  ///         interface: "FtsoV2Interface",
  ///         registry: "FtsoV2",
  /// ```
  factory RegistryNames.parse(String source) {
    final pattern = RegExp(
      r'interface:\s*"([A-Za-z0-9_]+)"\s*,\s*registry:\s*"([A-Za-z0-9_]+)"',
      multiLine: true,
    );

    final byInterface = <String, Set<String>>{};
    for (final m in pattern.allMatches(source)) {
      (byInterface[m.group(1)!] ??= <String>{}).add(m.group(2)!);
    }

    // An interface that maps to more than one registry name cannot have a
    // sensible default, so it is dropped and the caller must be explicit.
    // Measured on artifacts 0.1.52: no such case exists, but the guard keeps a
    // future collision from silently picking one at random.
    return RegistryNames({
      for (final e in byInterface.entries)
        if (e.value.length == 1) e.key: e.value.single,
    });
  }
}
