import 'dart:io';
import 'package:dthlms/login/dth_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    setWindowMinSize(const Size(1400, 1000));
  }
  runApp(
    const MyApp(),
  );
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
      home: DthLmsLogin(),
    );
  }
}





// class SecureWindow extends StatefulWidget {
//   @override
//   _SecureWindowState createState() => _SecureWindowState();
// }

// class _SecureWindowState extends State<SecureWindow> {
//   bool _isVisible = true;

//   @override
//   void initState() {
//     super.initState();
//     SystemChannels.lifecycle.setMessageHandler((msg) {
//       print("LifecycleEvent: $msg");
//       if (msg?.contains('resumed') ?? false) {
//         setState(() => _isVisible = true);
//       } else if (msg?.contains('paused') ?? false) {
//         setState(() => _isVisible = false);
//       }
//       return Future.value("");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Secure Window Example"),
//       ),
//       body: Center(
//         child: _isVisible
//             ? Text('This is sensitive content visible only when the app is in focus.')
//             : Container(color: Colors.grey.shade800),
//       ),
//     );
//   }
// }