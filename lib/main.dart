import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_meta/device_meta.dart';
import 'package:dthlms/db/initializeDB/initializeDB.dart';
import 'package:dthlms/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_size/window_size.dart';
import 'package:windows_system_info/windows_system_info.dart';

import 'configaration/device/windows_device_id.dart';
import 'db/dbfunction/dbfunction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  // sqfliteFg
  // databaseFactory = databaseFactoryFfi;
  // if (Platform.isWindows) {
  //   setWindowMinSize(const Size(1400, 1000));
  // }
  // MediaKit.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Database? _database;
  @override
  void initState() {
    super.initState();
    ClsDeviceInfo.initInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DTH LMS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Dashboard());
  }
}
