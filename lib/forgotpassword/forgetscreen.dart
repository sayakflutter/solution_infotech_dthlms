import 'package:dthlms/ThemeData/FontSize/FontSize.dart';
import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  GlobalKey<FormState> key = GlobalKey();
  Getx getx = Get.put(Getx());
  final email = InputDecoration(
      hintText: 'solution@gmail.com',
      hintStyle: const TextStyle(color: Colors.grey),
      labelText: 'Email',
      labelStyle: GoogleFonts.outfit(),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorPage.color1),
          borderRadius: BorderRadius.circular(
            10,
          )),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorPage.color1),
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorPage.color1),
          borderRadius: BorderRadius.circular(10)));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 229, 234, 236),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/Black and Red Minimalist Modern Registration Gym Website Prototype (1).jpg'),
                    fit: BoxFit.fill)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 80,
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(100),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 50),
                                    child: SizedBox(
                                      // height: 400,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            'https://videoencryptor.com/assets/images/logo.png',
                                            width: 200,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Check your email',
                                          style: FontFamily.font,
                                          textScaler:
                                              const TextScaler.linear(1.3),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'We sent you an email to abcd@gmail.com',
                                          style: GoogleFonts.outfit(
                                              textStyle: TextStyle(
                                            fontSize:
                                                ClsFontsize.ExtraSmall - 2,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton.icon(
                                            style: const ButtonStyle(
                                                padding:
                                                    MaterialStatePropertyAll(
                                                        EdgeInsets.symmetric(
                                                            horizontal: 75))),
                                            onPressed: () {
                                              void openEmailClient() async {
                                                final Uri emailLaunchUri = Uri(
                                                  scheme: 'mailto',
                                                  path: '',
                                                );
                                                if (await canLaunchUrlString(
                                                    emailLaunchUri
                                                        .toString())) {
                                                  await launchUrl(
                                                      emailLaunchUri);
                                                } else {
                                                  throw 'Could not launch email';
                                                }
                                              }

                                              openEmailClient();
                                            },
                                            icon: Image.asset(
                                              'assets/email.png',
                                              width: 40,
                                            ),
                                            label: Text(
                                              'Open Email App',
                                              style: FontFamily.font,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OutlinedButton.icon(
                                          style: const ButtonStyle(
                                              padding: MaterialStatePropertyAll(
                                                  EdgeInsets.symmetric(
                                                      horizontal: 95))),
                                          onPressed: () async {
                                            final Uri gmailUrl = Uri(
                                              scheme: 'https',
                                              host: 'mail.google.com',
                                              path: '/mail/u/0/',
                                              // queryParameters: {
                                              //   'authuser': '0'
                                              // }, // Change '0' to the account index you want to open
                                            );

                                            await launchUrlString(
                                                gmailUrl.toString());
                                          },
                                          icon: Image.asset(
                                            'assets/gmail.png',
                                            width: 40,
                                          ),
                                          label: Text(
                                            'Open Email',
                                            style: FontFamily.font,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton.icon(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_rounded,
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'Back to Login',
                                            style: GoogleFonts.outfit(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ClsFontsize.ExtraSmall -
                                                            1)),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 80,
                            // color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 70, horizontal: 100),
                              child: Form(
                                key: key,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 50),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Forgot your password',
                                            style: FontFamily.font,
                                            textScaler:
                                                const TextScaler.linear(1.4),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: SizedBox(
                                        // height: 400,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: 300,
                                                child: TextFormField(
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    style: const TextStyle(),
                                                    decoration: email))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: 300,
                                              child: Obx(
                                                () => TextFormField(
                                                    obscureText: getx
                                                        .forgetpassword1.value,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: InputDecoration(
                                                        hintStyle: const TextStyle(
                                                            color: Colors.grey),
                                                        labelStyle: GoogleFonts
                                                            .outfit(),
                                                        hintText: 'Password',
                                                        labelText: 'Password',
                                                        suffixIcon: IconButton(
                                                            onPressed: () {
                                                              getx.forgetpassword1
                                                                      .value =
                                                                  !getx
                                                                      .forgetpassword1
                                                                      .value;
                                                            },
                                                            icon: getx
                                                                    .forgetpassword1
                                                                    .value
                                                                ? const Icon(
                                                                    Icons
                                                                        .visibility,
                                                                  )
                                                                : const Icon(
                                                                    Icons
                                                                        .visibility_off,
                                                                  )),
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: ColorPage
                                                                        .color1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  10,
                                                                )),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: ColorPage
                                                                        .color1),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10)),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(color: ColorPage.color1),
                                                            borderRadius: BorderRadius.circular(10)))),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: 300,
                                              child: Obx(
                                                () => TextFormField(
                                                  obscureText: getx
                                                      .forgetpassword2.value,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  style: const TextStyle(),
                                                  decoration: InputDecoration(
                                                      labelStyle:
                                                          GoogleFonts.outfit(),
                                                      hintStyle: const TextStyle(
                                                          color: Colors.grey),
                                                      hintText:
                                                          'Confirm Password',
                                                      labelText:
                                                          'Confirm Password',
                                                      suffixIcon: IconButton(
                                                          onPressed: () {
                                                            getx.forgetpassword2
                                                                    .value =
                                                                !getx
                                                                    .forgetpassword2
                                                                    .value;
                                                          },
                                                          icon: getx
                                                                  .forgetpassword2
                                                                  .value
                                                              ? const Icon(
                                                                  Icons
                                                                      .visibility,
                                                                )
                                                              : const Icon(
                                                                  Icons
                                                                      .visibility_off,
                                                                )),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: ColorPage
                                                                      .color1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                10,
                                                              )),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: ColorPage
                                                                      .color1),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: ColorPage.color1),
                                                          borderRadius: BorderRadius.circular(10))),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 40),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: OutlinedButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        const MaterialStatePropertyAll(
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        50,
                                                                    vertical:
                                                                        15)),
                                                    shape: MaterialStatePropertyAll(
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)))),
                                                onPressed: () {},
                                                child: Text(
                                                  'Cancel',
                                                  style: GoogleFonts.outfit(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black)),
                                                )),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        const MaterialStatePropertyAll(
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        60,
                                                                    vertical:
                                                                        15)),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            ColorPage.color1),
                                                    shape: MaterialStatePropertyAll(
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)))),
                                                onPressed: () {},
                                                child: Text(
                                                  'Save',
                                                  style: FontFamily.font3,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
