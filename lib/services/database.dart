import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Provider to use database
final databaseProvider = Provider<DatabaseProvider>((ref) => DatabaseProvider());

class DatabaseProvider {

  // Initialization
  Future<void> initiateDatabase() async {
    await Hive.initFlutter();
    await Hive.openBox(globalBoxName);
  }

  var globalBoxName = 'db2';

  Box get box => Hive.box(globalBoxName);

  /// Put any type of value in the database with the string key
  Future<void> putPref(String key, dynamic value) async => await box.put(key, value);

  /// Get a value from the database with a String key
  dynamic getPref(String key) => box.get(key);

  /// Check if a value is in the database with a String key
  bool checkKeyPref(key) => box.containsKey(key);

}