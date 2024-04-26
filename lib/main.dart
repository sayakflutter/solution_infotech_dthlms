import 'dart:io';

import 'package:dthlms/login/dth_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    // setWindowMaxSize(const Size(1280, 720));
    setWindowMinSize(const Size(1400, 800));
  }
  runApp(const MyApp());
  // await Firebase.initializeApp();
}

GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DTH LMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DthLmsLogin(),
    );
  }
}
