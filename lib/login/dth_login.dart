import 'dart:io';

import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../google/googlesign.dart';

class DthLmsLogin extends StatefulWidget {
  const DthLmsLogin({super.key});

  @override
  State<DthLmsLogin> createState() => _DthLmsLoginState();
}

class _DthLmsLoginState extends State<DthLmsLogin> {
  TextEditingController signupname = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signupphno = TextEditingController();
  TextEditingController signuppassword = TextEditingController();

  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  TextEditingController loginotp = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  late double formfieldsize = 400;
  late double fontsize = 30;
  Getx getxController = Get.put(Getx());
  InputBorder border =
      UnderlineInputBorder(borderSide: BorderSide(color: ColorPage.colorgrey));
  @override
  void initState() {
    formfieldsize = Platform.isAndroid ? 300 : formfieldsize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/Black and Red Minimalist Modern Registration Gym Website Prototype (1).jpg'),
                  fit: BoxFit.fill),
            ),
            child: Platform.isWindows
                ? Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        fit: BoxFit.contain,
                                        'assets/loginimg2.png',
                                        height:
                                            MediaQuery.sizeOf(context).height -
                                                100,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 80,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          tooltip: 'Settings',
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.settings,
                                            size: 40,
                                            color: ColorPage.colorgrey,
                                          )),
                                      IconButton(
                                          tooltip: 'Dashboard',
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.dashboard_rounded,
                                            color: ColorPage.colorgrey,
                                            size: 40,
                                          )),
                                      IconButton(
                                          tooltip: 'Profile',
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.person_pin,
                                            color: ColorPage.colorgrey,
                                            size: 40,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    elevation: 80,
                                    child: Container(
                                      width: 500,
                                      // height: MediaQuery.sizeOf(context).height - 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child: Obx(
                                        () => Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Text('Signup'),
                                                // Text('Login'),
                                                SizedBox(
                                                  width: 400,
                                                  child: AnimatedButtonBar(
                                                    controller:
                                                        AnimatedButtonController()
                                                          ..setIndex(1),
                                                    radius: 32.0,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    backgroundColor: Colors
                                                        .blueGrey.shade800,
                                                    foregroundColor: Colors
                                                        .blueGrey.shade300,
                                                    elevation: 24,
                                                    curve: Curves.linear,
                                                    borderColor: Colors.white,
                                                    borderWidth: 2,
                                                    innerVerticalPadding: 16,
                                                    children: [
                                                      ButtonBarEntry(
                                                          onTap: () {
                                                            getxController.show
                                                                .value = true;
                                                          },
                                                          child: Text(
                                                            'Sign Up',
                                                            style:
                                                                FontFamily.font,
                                                          )),
                                                      ButtonBarEntry(
                                                          onTap: () {
                                                            getxController.show
                                                                .value = false;
                                                          },
                                                          child: Text(
                                                            'Log in',
                                                            style:
                                                                FontFamily.font,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            getxController.show.value
                                                ? Form(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    key: _key,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  formfieldsize,
                                                              child: Text(
                                                                'Full Name',
                                                                style:
                                                                    FontFamily
                                                                        .font,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextFormField(
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                        .isEmpty) {
                                                                      return 'Cannot blank';
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .name,
                                                                  controller:
                                                                      signupname,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder:
                                                                          border,
                                                                      focusedBorder:
                                                                          border,
                                                                      hintText:
                                                                          'Your Name'),
                                                                ))
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  formfieldsize,
                                                              child: Text(
                                                                'Email',
                                                                style:
                                                                    FontFamily
                                                                        .font,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextFormField(
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                        .isEmpty) {
                                                                      return 'Cannot blank';
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .emailAddress,
                                                                  controller:
                                                                      signupemail,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder:
                                                                          border,
                                                                      focusedBorder:
                                                                          border,
                                                                      hintText:
                                                                          'hello@email.com'),
                                                                ))
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  formfieldsize,
                                                              child: Text(
                                                                'Phone Number',
                                                                style:
                                                                    FontFamily
                                                                        .font,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextFormField(
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                        .isEmpty) {
                                                                      return 'Cannot blank';
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .phone,
                                                                  controller:
                                                                      signupphno,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder:
                                                                          border,
                                                                      focusedBorder:
                                                                          border,
                                                                      hintText:
                                                                          '**********'),
                                                                ))
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  formfieldsize,
                                                              child: Text(
                                                                'Password',
                                                                style:
                                                                    FontFamily
                                                                        .font,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextFormField(
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                        .isEmpty) {
                                                                      return 'Cannot blank';
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .visiblePassword,
                                                                  controller:
                                                                      signuppassword,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder:
                                                                          border,
                                                                      focusedBorder:
                                                                          border,
                                                                      suffixIcon: IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon: const Icon(Icons
                                                                              .visibility)),
                                                                      hintText:
                                                                          'Password'),
                                                                ))
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 20),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  width:
                                                                      formfieldsize,
                                                                  child:
                                                                      MaterialButton(
                                                                    shape: ContinuousRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            10),
                                                                    color: ColorPage
                                                                        .colorgrey,
                                                                    onPressed:
                                                                        () {
                                                                      if (_key
                                                                          .currentState!
                                                                          .validate()) {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => const Material(
                                                                                      child: Scaffold(
                                                                                        body: Center(
                                                                                          child: Text('Home Page'),
                                                                                        ),
                                                                                      ),
                                                                                    )));
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'Sign Up',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              fontsize,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                        const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Already a member ?',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    MaterialButton(
                                                                  shape: ContinuousRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),

                                                                  // color: ColorPage.colorgrey,
                                                                  onPressed:
                                                                      () {},
                                                                  child:
                                                                      const Text(
                                                                    'Login',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Form(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    key: _key,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  formfieldsize,
                                                              child: Text(
                                                                'Email',
                                                                style:
                                                                    FontFamily
                                                                        .font,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextFormField(
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                        .isEmpty) {
                                                                      return 'Cannot blank';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  controller:
                                                                      loginemail,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .emailAddress,
                                                                  // controller: ,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder:
                                                                          border,
                                                                      focusedBorder:
                                                                          border,
                                                                      hintText:
                                                                          'hello@gmail.com'),
                                                                ))
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  formfieldsize,
                                                              child: Text(
                                                                'Password',
                                                                style:
                                                                    FontFamily
                                                                        .font,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextFormField(
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                        .isEmpty) {
                                                                      return 'Cannot blank';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  controller:
                                                                      loginpassword,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .visiblePassword,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder:
                                                                          border,
                                                                      focusedBorder:
                                                                          border,
                                                                      hintText:
                                                                          '***********'),
                                                                ))
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  formfieldsize,
                                                              child: Text(
                                                                'OTP',
                                                                style:
                                                                    FontFamily
                                                                        .font,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextFormField(
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                        .isEmpty) {
                                                                      return 'Cannot blank';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  controller:
                                                                      loginotp,
                                                                  keyboardType:
                                                                      const TextInputType
                                                                          .numberWithOptions(),
                                                                  decoration: InputDecoration(
                                                                      enabledBorder:
                                                                          border,
                                                                      focusedBorder:
                                                                          border,
                                                                      suffixIcon: IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon: const Icon(Icons
                                                                              .visibility)),
                                                                      hintText:
                                                                          '***********'),
                                                                ))
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 20),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  width:
                                                                      formfieldsize,
                                                                  child:
                                                                      MaterialButton(
                                                                    shape: ContinuousRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            10),
                                                                    color: ColorPage
                                                                        .colorgrey,
                                                                    onPressed:
                                                                        () {
                                                                      if (_key
                                                                          .currentState!
                                                                          .validate()) {
                                                                        _key.currentState!
                                                                            .save();
                                                                        Get.to(() =>
                                                                            const Dashboard());
                                                                        // Navigator.push(
                                                                        //     context,
                                                                        //     MaterialPageRoute(
                                                                        //         builder: (context) => Material(
                                                                        //               child: Scaffold(
                                                                        //                 body: Center(
                                                                        //                     child: ElevatedButton(
                                                                        //                         onPressed: () async {
                                                                        //                           const link = WhatsAppUnilink(
                                                                        //                             phoneNumber: '+919749088472',
                                                                        //                             text: "Hey! I'm inquiring about the apartment listing",
                                                                        //                           );
                                                                        //                           Platform.isWindows ? await launchUrl(Uri.parse("https://wa.me/${9749088472}?text=Hello")) : await launchUrlString('$link');
                                                                        //                           // launchWhatsAppUri() async {

                                                                        //                           //   // Convert the WhatsAppUnilink instance to a Uri.
                                                                        //                           //   // The "launch" method is part of "url_launcher".
                                                                        //                           //  ;
                                                                        //                           //   print('https://web.whatsapp.com/$link');
                                                                        //                           // }

                                                                        //                           // launchWhatsAppUri();
                                                                        //                         },
                                                                        //                         child: Text('Link'))),
                                                                        //               ),
                                                                        //             )));
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'Login',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              fontsize,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                        const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'New User ?',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    MaterialButton(
                                                                  shape: ContinuousRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),

                                                                  // color: ColorPage.colorgrey,
                                                                  onPressed:
                                                                      () {},
                                                                  child:
                                                                      const Text(
                                                                    'Create an account',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
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
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 30,
                                            child: SizedBox(
                                                width: formfieldsize,
                                                child: ElevatedButton.icon(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors
                                                                  .amber[400]),
                                                      padding:
                                                          const MaterialStatePropertyAll(
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                      ),
                                                      shape:
                                                          MaterialStatePropertyAll(
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      )),

                                                  // color: ColorPage.colorgrey,
                                                  onPressed: () {
                                                    // final obj = GoogleSignup();
                                                    // obj.signin();
                                                  },
                                                  icon: Image.asset(
                                                      'assets/google.png'),
                                                  label: Text(
                                                      'Connect with Google',
                                                      style: FontFamily.font),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        backgroundColor:
                                            Colors.blueGrey.shade800,
                                        foregroundColor:
                                            Colors.blueGrey.shade300,
                                        elevation: 24,
                                        curve: Curves.linear,
                                        borderColor: Colors.white,
                                        borderWidth: 2,
                                        innerVerticalPadding: 16,
                                        children: [
                                          ButtonBarEntry(
                                              onTap: () {
                                                getxController.show.value =
                                                    true;
                                              },
                                              child: Text(
                                                'Sign Up',
                                                style: FontFamily.font,
                                              )),
                                          ButtonBarEntry(
                                              onTap: () {
                                                getxController.show.value =
                                                    false;
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
                                        key: _key,
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
                                                    style:
                                                        FontFamily.mobilefont,
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
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  border,
                                                              focusedBorder:
                                                                  border,
                                                              hintText:
                                                                  'Your Name'),
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
                                                    style:
                                                        FontFamily.mobilefont,
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
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Cannot blank';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
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
                                                    style:
                                                        FontFamily.mobilefont,
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
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  border,
                                                              focusedBorder:
                                                                  border,
                                                              hintText:
                                                                  '**********'),
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
                                                    style:
                                                        FontFamily.mobilefont,
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
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Cannot blank';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      keyboardType:
                                                          TextInputType
                                                              .visiblePassword,
                                                      controller:
                                                          signuppassword,
                                                      decoration: InputDecoration(
                                                          enabledBorder: border,
                                                          focusedBorder: border,
                                                          suffixIcon: IconButton(
                                                              onPressed: () {},
                                                              icon: const Icon(Icons
                                                                  .visibility)),
                                                          hintText: 'Password'),
                                                    ))
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      width: formfieldsize,
                                                      // height: 30,
                                                      child: MaterialButton(
                                                        shape: ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5),
                                                        color:
                                                            ColorPage.colorgrey,
                                                        onPressed: () {
                                                          if (_key.currentState!
                                                              .validate()) {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const Material(
                                                                              child: Scaffold(
                                                                                body: Center(
                                                                                  child: Text('Home Page'),
                                                                                ),
                                                                              ),
                                                                            )));
                                                          }
                                                        },
                                                        child: const Text(
                                                          'Sign Up',
                                                          style: TextStyle(
                                                              fontSize: 25,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Already a member ?',
                                                  style: TextStyle(
                                                    fontSize: 16,
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
                                                                      .circular(
                                                                          20)),

                                                      // color: ColorPage.colorgrey,
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'Login',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : Form(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        key: _key,
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
                                                    style:
                                                        FontFamily.mobilefont,
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
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Cannot blank';
                                                        }
                                                        return null;
                                                      },
                                                      controller: loginemail,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
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
                                                    style:
                                                        FontFamily.mobilefont,
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
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Cannot blank';
                                                        }
                                                        return null;
                                                      },
                                                      controller: loginpassword,
                                                      keyboardType:
                                                          TextInputType
                                                              .visiblePassword,
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  border,
                                                              focusedBorder:
                                                                  border,
                                                              hintText:
                                                                  '***********'),
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
                                                    'OTP',
                                                    style:
                                                        FontFamily.mobilefont,
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
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Cannot blank';
                                                        }
                                                        return null;
                                                      },
                                                      controller: loginotp,
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(),
                                                      decoration: InputDecoration(
                                                          enabledBorder: border,
                                                          focusedBorder: border,
                                                          suffixIcon: IconButton(
                                                              onPressed: () {},
                                                              icon: const Icon(Icons
                                                                  .visibility)),
                                                          hintText:
                                                              '***********'),
                                                    ))
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      width: formfieldsize,
                                                      child: MaterialButton(
                                                        shape: ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 10),
                                                        color:
                                                            ColorPage.colorgrey,
                                                        onPressed: () {
                                                          if (_key.currentState!
                                                              .validate()) {
                                                            _key.currentState!
                                                                .save();

                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Material(
                                                                              child: Scaffold(
                                                                                body: Center(
                                                                                    child: ElevatedButton(
                                                                                        onPressed: () async {
                                                                                          const link = WhatsAppUnilink(
                                                                                            phoneNumber: '+919749088472',
                                                                                            text: "Hey! I'm inquiring about the apartment listing",
                                                                                          );
                                                                                          Platform.isWindows ? await launchUrl(Uri.parse("https://wa.me/${9749088472}?text=Hello")) : await launchUrlString('$link');
                                                                                          // launchWhatsAppUri() async {

                                                                                          //   // Convert the WhatsAppUnilink instance to a Uri.
                                                                                          //   // The "launch" method is part of "url_launcher".
                                                                                          //  ;
                                                                                          //   print('https://web.whatsapp.com/$link');
                                                                                          // }

                                                                                          // launchWhatsAppUri();
                                                                                        },
                                                                                        child: Text('Link'))),
                                                                              ),
                                                                            )));
                                                          }
                                                        },
                                                        child: Text(
                                                          'Login',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  fontsize,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'New User ?',
                                                  style: TextStyle(
                                                    fontSize: 16,
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
                                                                      .circular(
                                                                          20)),

                                                      // color: ColorPage.colorgrey,
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'Create an account',
                                                        style: TextStyle(
                                                          fontSize: 16,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 30,
                              child: SizedBox(
                                  width: formfieldsize,
                                  height: 50,
                                  child: ElevatedButton.icon(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.amber[400]),
                                        padding: const MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(vertical: 10),
                                        ),
                                        shape: MaterialStatePropertyAll(
                                          ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        )),

                                    // color: ColorPage.colorgrey,
                                    onPressed: () {
                                      final obj = GoogleSignup();
                                      obj.signin();
                                    },
                                    icon: Image.asset(
                                      'assets/google.png',
                                      width: 50,
                                    ),
                                    label: Text('Connect with Google',
                                        style: TextStyle(
                                            color: ColorPage.colorgrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
