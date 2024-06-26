import 'dart:io';

import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:dthlms/ThemeData/FontSize/FontSize.dart';
import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/forgotpassword/forgetscreen.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/login/login_api.dart';
import 'package:dthlms/otp/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Mobilelogin extends StatefulWidget {
  const Mobilelogin({super.key});

  @override
  State<Mobilelogin> createState() => _MobileloginState();
}

class _MobileloginState extends State<Mobilelogin> {
  TextEditingController signupuser = TextEditingController();
  TextEditingController signupname = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signupphno = TextEditingController();
  TextEditingController signuppassword = TextEditingController();

  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  TextEditingController loginotp = TextEditingController();

  // ignore: non_constant_identifier_names
  final GlobalKey<FormState> desktop_key = GlobalKey();

  // ignore: non_constant_identifier_names
  final GlobalKey<FormState> mobile_key = GlobalKey();
  late double formfieldsize = MediaQuery.of(context).size.width - 60;
  late double fontsize = ClsFontsize.ExtraLarge + 2;
  Getx getxController = Get.put(Getx());
  InputBorder border = const UnderlineInputBorder(
      borderSide: BorderSide(color: ColorPage.colorgrey));
  var key = '0';
  Getx getx = Get.put(Getx());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/Black and Red Minimalist Modern Registration Gym Website Prototype (1).jpg'),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  elevation: 80,
                  child: Container(
                    width: 400,
                    // height: MediaQuery.sizeOf(context).height - 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                // height: 200,
                                // color: Colors.red,
                                child: Image.network(
                                  'https://videoencryptor.com/assets/images/logo.png',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text('Signup'),
                              // Text('Login'),
                              SizedBox(
                                width: 300,
                                child: AnimatedButtonBar(
                                  controller: AnimatedButtonController()
                                    ..setIndex(1),
                                  radius: 32.0,
                                  padding: const EdgeInsets.all(16.0),
                                  backgroundColor: Colors.blueGrey.shade800,
                                  foregroundColor: Colors.blueGrey.shade300,
                                  elevation: 24,
                                  curve: Curves.linear,
                                  borderColor: Colors.white,
                                  borderWidth: 2,
                                  innerVerticalPadding: 16,
                                  children: [
                                    ButtonBarEntry(
                                        onTap: () {
                                          getxController.show.value = true;
                                        },
                                        child: Text(
                                          'Sign Up',
                                          style: FontFamily.font,
                                        )),
                                    ButtonBarEntry(
                                        onTap: () {
                                          getxController.show.value = false;
                                        },
                                        child: Text(
                                          'Log in',
                                          style: FontFamily.font,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          getxController.show.value
                              ? Form(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  key: mobile_key,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: formfieldsize,
                                            child: Text(
                                              'Full Name',
                                              style: FontFamily.mobilefont,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Cannot blank';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.name,
                                                controller: signupname,
                                                decoration: InputDecoration(
                                                    enabledBorder: border,
                                                    focusedBorder: border,
                                                    hintText: 'Your Name'),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: formfieldsize,
                                            child: Text(
                                              'Email',
                                              style: FontFamily.mobilefont,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Cannot blank';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                controller: signupemail,
                                                decoration: InputDecoration(
                                                    enabledBorder: border,
                                                    focusedBorder: border,
                                                    hintText:
                                                        'hello@email.com'),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: formfieldsize,
                                            child: Text(
                                              'Phone Number',
                                              style: FontFamily.mobilefont,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Cannot blank';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller: signupphno,
                                                decoration: InputDecoration(
                                                    enabledBorder: border,
                                                    focusedBorder: border,
                                                    hintText: '**********'),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: formfieldsize,
                                            child: Text(
                                              'Password',
                                              style: FontFamily.mobilefont,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Cannot blank';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                controller: signuppassword,
                                                decoration: InputDecoration(
                                                    enabledBorder: border,
                                                    focusedBorder: border,
                                                    suffixIcon: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.visibility)),
                                                    hintText: 'Password'),
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: formfieldsize,
                                                // height: 30,
                                                child: MaterialButton(
                                                  shape:
                                                      ContinuousRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  color: ColorPage.colorgrey,
                                                  onPressed: () {
                                                    if (mobile_key.currentState!
                                                        .validate()) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const Material(
                                                                    child:
                                                                        Scaffold(
                                                                      body:
                                                                          Center(
                                                                        child: Text(
                                                                            'Home Page'),
                                                                      ),
                                                                    ),
                                                                  )));
                                                    }
                                                  },
                                                  child: Text(
                                                    'Sign Up',
                                                    style: TextStyle(
                                                        fontSize:
                                                            ClsFontsize.Large,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Already a member ?',
                                            style: TextStyle(
                                              fontSize: ClsFontsize.ExtraSmall,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              // height: 10,
                                              child: MaterialButton(
                                                shape:
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),

                                                // color: ColorPage.colorgrey,
                                                onPressed: () {},
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    fontSize: ClsFontsize
                                                        .DoubleExtraSmall,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Form(
                                  key: mobile_key,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: formfieldsize,
                                            child: Text(
                                              'Email',
                                              style: FontFamily.mobilefont,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Cannot blank';
                                                  }
                                                  return null;
                                                },
                                                controller: loginemail,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                // controller: ,
                                                decoration: InputDecoration(
                                                    enabledBorder: border,
                                                    focusedBorder: border,
                                                    hintText:
                                                        'hello@gmail.com'),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: formfieldsize,
                                            child: Text(
                                              'Password',
                                              style: FontFamily.mobilefont,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Cannot blank';
                                                  }
                                                  return null;
                                                },
                                                controller: loginpassword,
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                decoration: InputDecoration(
                                                    enabledBorder: border,
                                                    focusedBorder: border,
                                                    hintText: '***********'),
                                              ))
                                        ],
                                      ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.center,
                                      //   children: [
                                      //     SizedBox(
                                      //       width: formfieldsize,
                                      //       child: Text(
                                      //         'OTP',
                                      //         style:
                                      //             FontFamily.mobilefont,
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.center,
                                      //   children: [
                                      //     SizedBox(
                                      //         width: formfieldsize,
                                      //         child: TextFormField(
                                      //           autovalidateMode:
                                      //               AutovalidateMode
                                      //                   .onUserInteraction,
                                      //           validator: (value) {
                                      //             if (value!.isEmpty) {
                                      //               return 'Cannot blank';
                                      //             }
                                      //             return null;
                                      //           },
                                      //           controller: loginotp,
                                      //           keyboardType:
                                      //               const TextInputType
                                      //                   .numberWithOptions(),
                                      //           decoration: InputDecoration(
                                      //               enabledBorder: border,
                                      //               focusedBorder: border,
                                      //               suffixIcon: IconButton(
                                      //                   onPressed: () {},
                                      //                   icon: const Icon(Icons
                                      //                       .visibility)),
                                      //               hintText:
                                      //                   '***********'),
                                      //         ))
                                      //   ],
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: formfieldsize,
                                                child: MaterialButton(
                                                  shape:
                                                      ContinuousRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  color: ColorPage.colorgrey,
                                                  onPressed: () {
                                                    if (mobile_key.currentState!
                                                        .validate()) {
                                                      mobile_key.currentState!
                                                          .save();

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Material(
                                                                        child:
                                                                            Scaffold(
                                                                          body: Center(
                                                                              child: ElevatedButton(
                                                                                  onPressed: () async {
                                                                                    Get.toNamed('/Mobilehomepage');
                                                                                    // const link = WhatsAppUnilink(
                                                                                    //   phoneNumber: '+919749088472',
                                                                                    //   text: "Hey! I'm inquiring about the apartment listing",
                                                                                    // );
                                                                                    // Platform.isWindows ? await launchUrl(Uri.parse("https://wa.me/${9749088472}?text=Hello")) : await launchUrlString('$link');
                                                                                    // launchWhatsAppUri() async {

                                                                                    //   // Convert the WhatsAppUnilink instance to a Uri.
                                                                                    //   // The "launch" method is part of "url_launcher".
                                                                                    //  ;
                                                                                    //   print('https://web.whatsapp.com/$link');
                                                                                    // }

                                                                                    // launchWhatsAppUri();
                                                                                  },
                                                                                  child: const Text('Link'))),
                                                                        ),
                                                                      )));
                                                    }
                                                  },
                                                  child: Text(
                                                    'Login',
                                                    style: TextStyle(
                                                        fontSize: fontsize,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'New User ?',
                                            style: TextStyle(
                                              fontSize: ClsFontsize.ExtraSmall,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: formfieldsize,
                                              child: MaterialButton(
                                                shape:
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),

                                                // color: ColorPage.colorgrey,
                                                onPressed: () {},
                                                child: Text(
                                                  'Create an account',
                                                  style: TextStyle(
                                                    fontSize:
                                                        ClsFontsize.ExtraSmall,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
