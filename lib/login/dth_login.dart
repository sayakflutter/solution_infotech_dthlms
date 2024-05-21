import 'dart:io';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:dthlms/ThemeData/FontSize/FontSize.dart';
import 'package:dthlms/android/login/dth_mob_login.dart';
import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/forgotpassword/forgetscreen.dart';
import '../getx/getxcontroller.dart';
import 'package:dthlms/login/login_api.dart';
import 'package:dthlms/otp/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class DthLmsLogin extends StatefulWidget {
  const DthLmsLogin({super.key});

  @override
  State<DthLmsLogin> createState() => _DthLmsLoginState();
}

class _DthLmsLoginState extends State<DthLmsLogin> {
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
  late double formfieldsize = 400;
  late double fontsize = ClsFontsize.DoubleExtraLarge + 2;
  Getx getxController = Get.put(Getx());
  InputBorder border = const UnderlineInputBorder(
      borderSide: BorderSide(color: ColorPage.colorgrey));
  final bool _isVisible = true;
  @override
  void initState() {
    formfieldsize = Platform.isAndroid ? 300 : formfieldsize;
    // SystemChannels.lifecycle.setMessageHandler((msg) {
    //   print("LifecycleEvent: $msg");
    //   if (msg?.contains('resumed') ?? false) {
    //     setState(() => _isVisible = true);
    //   } else if (msg?.contains('paused') ?? false) {
    //     setState(() => _isVisible = false);
    //   }
    //   return Future.value("");
    // });
    // print(_isVisible);
    super.initState();
  }

  var key = '0';
  Getx getx = Get.put(Getx());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          body: _isVisible && Platform.isWindows
              ? SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/Black and Red Minimalist Modern Registration Gym Website Prototype (1).jpg'),
                          fit: BoxFit.fill),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          fit: BoxFit.contain,
                                          'assets/loginimg2.png',
                                          height: MediaQuery.sizeOf(context)
                                                  .height -
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
                                            icon: const Icon(
                                              Icons.settings,
                                              size: 40,
                                              color: ColorPage.colorgrey,
                                            )),
                                        IconButton(
                                            tooltip: 'Dashboard',
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.dashboard_rounded,
                                              color: ColorPage.colorgrey,
                                              size: 40,
                                            )),
                                        IconButton(
                                            tooltip: 'Profile',
                                            onPressed: () {},
                                            icon: const Icon(
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
                                                    alignment:
                                                        Alignment.topLeft,
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
                                                              getxController
                                                                  .show
                                                                  .value = true;
                                                            },
                                                            child: Text(
                                                              'Sign Up',
                                                              style: FontFamily
                                                                  .font,
                                                            )),
                                                        ButtonBarEntry(
                                                            onTap: () {
                                                              getxController
                                                                      .show
                                                                      .value =
                                                                  false;
                                                            },
                                                            child: Text(
                                                              'Log in',
                                                              style: FontFamily
                                                                  .font,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              getxController.show.value
                                                  ? Form(
                                                      key: desktop_key,
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
                                                                  'User name',
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
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
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
                                                                        signupuser,
                                                                    decoration: InputDecoration(
                                                                        enabledBorder:
                                                                            border,
                                                                        focusedBorder:
                                                                            border,
                                                                        hintText:
                                                                            'User name'),
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
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
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
                                                                        prefixIcon:
                                                                            const Icon(Icons
                                                                                .person),
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
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
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
                                                                        prefixIcon:
                                                                            const Icon(Icons
                                                                                .email),
                                                                        enabledBorder:
                                                                            border,
                                                                        focusedBorder:
                                                                            border,
                                                                        hintText:
                                                                            'hello@email.com'),
                                                                  ))
                                                            ],
                                                          ),
                                                          //  suffixIcon: IconButton(
                                                          //                   onPressed: () {
                                                          //                     if (signupemail.text.isNotEmpty &&
                                                          //                         GetUtils.isEmail(signupemail.text)) {
                                                          // signupcodegenerate(signupphno.text, signupemail.text, context).then((value) {
                                                          //   getx.otplineshow.value = true;
                                                          //   key = value;
                                                          // });
                                                          //                     }
                                                          //                   },
                                                          //                   icon: Text('Send OTP')),
                                                          // Obx(
                                                          //   () => Visibility(
                                                          //     visible: getx
                                                          //         .otplineshow
                                                          //         .value,
                                                          //     child: Row(
                                                          //       mainAxisAlignment:
                                                          //           MainAxisAlignment
                                                          //               .center,
                                                          //       children: [
                                                          //         key.isNotEmpty
                                                          //             ? SizedBox(
                                                          //                 width:
                                                          //                     formfieldsize,
                                                          //                 child: Text(
                                                          //                     'OTP has been send to your mail'),
                                                          //               )
                                                          //             : SizedBox(
                                                          //                 width:
                                                          //                     formfieldsize,
                                                          //                 child: Text(
                                                          //                     'OTP send failed'),
                                                          //               )
                                                          //       ],
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .center,
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           formfieldsize,
                                                          //       child: Text(
                                                          //         'Email OTP',
                                                          //         style:
                                                          //             FontFamily
                                                          //                 .font,
                                                          //       ),
                                                          //     )
                                                          //   ],
                                                          // ),
                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .center,
                                                          //   children: [
                                                          //     SizedBox(
                                                          //         width:
                                                          //             formfieldsize,
                                                          //         child: Obx(
                                                          //           () =>
                                                          //               TextFormField(
                                                          //             textInputAction:
                                                          //                 TextInputAction
                                                          //                     .route,
                                                          //             obscureText: getx
                                                          //                 .otpshow
                                                          //                 .value,
                                                          //             autovalidateMode:
                                                          //                 AutovalidateMode
                                                          //                     .onUserInteraction,
                                                          //             validator:
                                                          //                 (value) {
                                                          //               if (value!
                                                          //                   .isEmpty) {
                                                          //                 return 'Cannot blank';
                                                          //               }
                                                          //               return null;
                                                          //             },
                                                          //             controller:
                                                          //                 loginotp,
                                                          //             keyboardType:
                                                          //                 const TextInputType
                                                          //                     .numberWithOptions(),
                                                          //             decoration: InputDecoration(
                                                          //                 enabledBorder: border,
                                                          //                 focusedBorder: border,
                                                          //                 suffixIcon: IconButton(
                                                          //                     onPressed: () {
                                                          //                       getx.otpshow.value = !getx.otpshow.value;
                                                          //                     },
                                                          //                     icon: getx.otpshow.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                                                          //                 hintText: '***********'),
                                                          //           ),
                                                          //         ))
                                                          //   ],
                                                          // ),
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
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
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
                                                                        prefixIcon:
                                                                            const Icon(Icons
                                                                                .phone),
                                                                        enabledBorder:
                                                                            border,
                                                                        focusedBorder:
                                                                            border,
                                                                        hintText:
                                                                            '9000000000'),
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
                                                              Obx(
                                                                () => SizedBox(
                                                                    width:
                                                                        formfieldsize,
                                                                    child:
                                                                        TextFormField(
                                                                      obscureText: getx
                                                                          .signuppasswordshow
                                                                          .value,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .next,
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
                                                                          prefixIcon: const Icon(Icons.password),
                                                                          enabledBorder: border,
                                                                          focusedBorder: border,
                                                                          suffixIcon: IconButton(
                                                                              onPressed: () {
                                                                                getx.signuppasswordshow.value = !getx.signuppasswordshow.value;
                                                                              },
                                                                              icon: getx.signuppasswordshow.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                                                                          hintText: '**********'),
                                                                    )),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                width:
                                                                    formfieldsize,
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.to(() =>
                                                                        const ForgotScreen());
                                                                  },
                                                                  child: Text(
                                                                    'Forget password',
                                                                    style: FontFamily
                                                                        .mobilefont,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        20),
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
                                                                        if (desktop_key.currentState!.validate() &
                                                                            GetUtils.isEmail(signupemail.text)) {
                                                                          desktop_key
                                                                              .currentState!
                                                                              .save();
                                                                          Get.to(
                                                                              () => OTPScreen(
                                                                                    signupuser.text,
                                                                                    signupname.text,
                                                                                    signupemail.text,
                                                                                    signuppassword.text,
                                                                                    signupphno.text,
                                                                                  ),
                                                                              transition: Transition.leftToRight);
                                                                        } else {
                                                                          Get.snackbar(
                                                                              "Error",
                                                                              "Please enter valid details",
                                                                              colorText: Colors.white);
                                                                        }
                                                                      },
                                                                      child:
                                                                          Text(
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
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Already a member ?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        ClsFontsize
                                                                            .ExtraSmall),
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
                                                                            BorderRadius.circular(20)),

                                                                    // color: ColorPage.colorgrey,
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                      'Login',
                                                                      style:
                                                                          TextStyle(
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
                                                  : Form(
                                                      key: desktop_key,
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
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
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
                                                                  child: Obx(
                                                                    () =>
                                                                        TextFormField(
                                                                      obscureText: getx
                                                                          .loginpasswordshow
                                                                          .value,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
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
                                                                          suffixIcon: IconButton(
                                                                              onPressed: () {
                                                                                getx.loginpasswordshow.value = !getx.loginpasswordshow.value;
                                                                              },
                                                                              icon: getx.loginpasswordshow.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                                                                          enabledBorder: border,
                                                                          focusedBorder: border,
                                                                          hintText: '***********'),
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .center,
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           formfieldsize,
                                                          //       child: Text(
                                                          //         'OTP',
                                                          //         style:
                                                          //             FontFamily
                                                          //                 .font,
                                                          //       ),
                                                          //     )
                                                          //   ],
                                                          // ),

                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .center,
                                                          //   children: [
                                                          //     SizedBox(
                                                          //         width:
                                                          //             formfieldsize,
                                                          //         child:
                                                          //             TextFormField(
                                                          //           autovalidateMode:
                                                          //               AutovalidateMode
                                                          //                   .onUserInteraction,
                                                          //           textInputAction:
                                                          //               TextInputAction
                                                          //                   .next,
                                                          //           validator:
                                                          //               (value) {
                                                          //             if (value!
                                                          //                 .isEmpty) {
                                                          //               return 'Cannot blank';
                                                          //             }
                                                          //             return null;
                                                          //           },
                                                          //           controller:
                                                          //               loginotp,
                                                          //           keyboardType:
                                                          //               const TextInputType
                                                          //                   .numberWithOptions(),
                                                          //           decoration: InputDecoration(
                                                          //               enabledBorder:
                                                          //                   border,
                                                          //               focusedBorder:
                                                          //                   border,
                                                          //               suffixIcon: IconButton(
                                                          //                   onPressed:
                                                          //                       () {},
                                                          //                   icon: const Icon(Icons
                                                          //                       .visibility)),
                                                          //               hintText:
                                                          //                   '***********'),
                                                          //         ))
                                                          //   ],
                                                          // ),

                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        20),
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
                                                                          () async {
                                                                        if (desktop_key
                                                                            .currentState!
                                                                            .validate()) {
                                                                          desktop_key
                                                                              .currentState!
                                                                              .save();
                                                                          await loginApi(
                                                                              context,
                                                                              loginemail.text,
                                                                              loginpassword.text,
                                                                              loginotp.text);
                                                                          // Get.to(() =>
                                                                          //     const Dashboard());
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
                                                                      child:
                                                                          Text(
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
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'New User ?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        ClsFontsize
                                                                            .ExtraSmall),
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
                                                                            BorderRadius.circular(20)),

                                                                    // color: ColorPage.colorgrey,
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                      'Create an account',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              ClsFontsize.ExtraSmall),
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
                                    // Flexible(
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(top: 25),
                                    //     child: Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.center,
                                    //       children: [
                                    //         Card(
                                    //           elevation: 30,
                                    //           child: SizedBox(
                                    //               width: formfieldsize,
                                    //               child: ElevatedButton.icon(
                                    //                 style: ButtonStyle(
                                    //                     backgroundColor:
                                    //                         MaterialStatePropertyAll(
                                    //                             Colors
                                    //                                 .amber[400]),
                                    //                     padding:
                                    //                         const MaterialStatePropertyAll(
                                    //                       EdgeInsets.symmetric(
                                    //                           vertical: 20),
                                    //                     ),
                                    //                     shape:
                                    //                         MaterialStatePropertyAll(
                                    //                       ContinuousRectangleBorder(
                                    //                           borderRadius:
                                    //                               BorderRadius
                                    //                                   .circular(
                                    //                                       20)),
                                    //                     )),

                                    //                 // color: ColorPage.colorgrey,
                                    //                 onPressed: () {
                                    //                   // final obj = GoogleSignup();
                                    //                   // obj.signin();
                                    //                 },
                                    //                 icon: Image.asset(
                                    //                     'assets/google.png'),
                                    //                 label: Text(
                                    //                     'Connect with Google',
                                    //                     style: FontFamily.font),
                                    //               )),
                                    //         )
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Platform.isAndroid
                  ? Mobilelogin()
                  : Container(
                      color: Colors.black,
                    )),
    );
  }
}
