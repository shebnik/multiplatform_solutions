import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class AssetManager {
  static Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/users.json');
  }
}
