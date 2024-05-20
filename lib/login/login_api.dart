import 'dart:convert';
import 'package:dthlms/errormsg/errorhandling.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/login/loginmodel.dart';
import 'package:dthlms/map/apiobject.dart';
import 'package:dthlms/pages/dashboard.dart';
import 'package:dthlms/url/api_url.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

Future loginApi(
  BuildContext context,
  String loginemail,
  String password,
  String otp,
) async {
  final getObj = Get.put(Getx());
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator.adaptive());
      });
  var logindata = ClsMap.objLoginApi(loginemail, password, otp);
  final res =
      await http.post(Uri.https(ClsUrlApi.mainurl, ClsUrlApi.loginEndpoint),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: json.encode(logindata));
  var jsondata = json.decode(res.body);
  if (res.statusCode == 200 &&
      jsondata['statusCode'] == 200 &&
      jsondata['isSuccess'] == true) {
    final userdata = DthloginUserDetails(
        email: jsondata['result']['email'],
        phoneNumber: jsondata['result']['phoneNumber'],
        token: jsondata['result']['token']);
    getObj.loginuserdata.add(userdata);

    Get.back();
    Get.to(() => const Dashboard());
  } else {
    Get.back();
    print(jsondata);
    ClsErrorMsg.fnErrorDialog(context, jsondata['errorMessages']);
  }
  
}

Future signupApi(BuildContext context, String signupuser, String signupname,
    signupemail, signuppassword, signupphno, key, otp) async {
  try {
    final getObj = Get.put(Getx());
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator.adaptive());
        });

    var signupdata = ClsMap.objSignupApi(signupuser, signupname, signupemail,
        signuppassword, signupphno, key, otp);
    final http.Response res = await http.post(
        Uri.https(ClsUrlApi.mainurl, '${ClsUrlApi.signupEndpoint}$key'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(signupdata));

    var jsondata = json.decode(res.body);
    if (res.statusCode == 200 &&
        jsondata['statusCode'] == 200 &&
        jsondata['isSuccess'] == true) {
      final userdata = DthloginUserDetails(
          email: jsondata['result']['email'],
          phoneNumber: jsondata['result']['phoneNumber'],
          token: jsondata['result']['token']);
      getObj.loginuserdata.add(userdata);

      Get.back();
      await FlutterPlatformAlert.playAlertSound();

      final result = await FlutterPlatformAlert.showCustomAlert(
        windowTitle: 'Login',
        text: 'Registration Sucessfull',
        positiveButtonTitle: "Ok",
      );
      if (CustomButton.positiveButton == result) {
        Get.to(() => const Dashboard());
      } else {}
    } else {
      Get.back();

      print(res.statusCode);

      await FlutterPlatformAlert.playAlertSound();

      // ignore: unused_local_variable
      final result = await FlutterPlatformAlert.showCustomAlert(
        windowTitle: 'Login',
        text: 'Resgistration failed',
        positiveButtonTitle: "Ok",
      );
    }
  } catch (e) {
    Get.back();
    await FlutterPlatformAlert.playAlertSound();

    // ignore: unused_local_variable
    final result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: 'Login',
      text: e.toString(),
      positiveButtonTitle: "Ok",
    );
  }
}

Future signupcodegenerate(
    String signupphno, String signupemail, BuildContext context) async {
  try {
    Getx getObj = Get.put(Getx());
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });
    var response = await http.get(Uri.https(
        ClsUrlApi.mainurl, ClsUrlApi.getUserConfirmationTypeEndpoint));
    var json = jsonDecode(response.body);

    print(response.body);

    if (response.statusCode == 200 && json['isSuccess'] == true) {
      Map<String, dynamic> datacode = {
        "phoneNumber": signupphno,
        "email": signupemail,
        "franchiseId": 1
      };
      var responsecode = await http.post(
          Uri.https(ClsUrlApi.mainurl, ClsUrlApi.generateCodeEndpoint),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(datacode));
      var json = jsonDecode(responsecode.body);

      print(responsecode.body);

      if (responsecode.statusCode == 200 && json['isSuccess'] == true) {
        String key = json['result'];
        getObj.otplineshow.value = true;
        Get.back();

        return key;
      } else {
        // print(responsecode.body);

        Get.back();
        await FlutterPlatformAlert.playAlertSound();

        // ignore: unused_local_variable
        final result = await FlutterPlatformAlert.showCustomAlert(
          windowTitle: 'Login',
          text: json["ErrorMessages"].toString(),
          positiveButtonTitle: "Ok",
        );

        return 'error';
      }
    }
  } catch (e) {
    Get.back();
    await FlutterPlatformAlert.playAlertSound();

    // ignore: unused_local_variable
    final result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: 'Login1',
      text: e.toString(),
      positiveButtonTitle: "Ok",
    );
    return 'error';
  }
}
