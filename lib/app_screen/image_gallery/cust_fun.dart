import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<String>> getFilePathFrom(String path) async {
  final pathList = json
      .decode(await rootBundle.loadString('AssetManifest.json'))
      .keys
      .where((String key) => key.contains(path))
      .toList();
  return pathList;
}
