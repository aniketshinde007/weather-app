import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final databaseProvider = Provider<DatabaseProvider>((ref) => DatabaseProvider());

class DatabaseProvider {

  Future<void> initiateDatabase() async {
    await Hive.initFlutter();
    await Hive.openBox(globalBoxName);
  }

  var globalBoxName = 'db2';

  Box get box => Hive.box(globalBoxName);

  Future<void> putPref(key, value) async => await box.put(key, value);

  getPref(key) => box.get(key);

  bool checkKeyPref(key) => box.containsKey(key);

}