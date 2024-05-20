import 'dart:io';
import 'package:dthlms/login/dth_login.dart';
import 'package:dthlms/pages/dashboard.dart';
import 'package:dthlms/routs/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    setWindowMinSize(const Size(1400, 1000));
  }
  // MediaKit.ensureInitialized();
  runApp(
     MyApp(),
  );
}



class MyApp extends StatelessWidget {
  pageRouter  x= pageRouter();
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    getPages: x.Route,
      debugShowCheckedModeBanner: false,
      title: 'DTH LMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     
    );
  }
}
