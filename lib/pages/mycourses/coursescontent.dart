import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/widget/drawerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../color/color.dart';
import '../../font/font_family.dart';
import '../../widget/buttonwidget.dart';
import 'mycoursesdashboar.dart';

// ignore: must_be_immutable
class MyClassDashboard extends StatefulWidget {
  String optionname;
  MyClassDashboard(this.optionname, {super.key});

  @override
  State<MyClassDashboard> createState() => _MyClassDashboardState();
}

class _MyClassDashboardState extends State<MyClassDashboard> {
  final obj = const ButtonWidget();
  Getx get_obj = Get.put(Getx());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: ColorPage.bgcolor,
        appBar: AppBar(
          title: Text(
            widget.optionname,
            style: FontFamily.font2,
            textScaler: const TextScaler.linear(1.7),
          ),
          backgroundColor: ColorPage.appbarcolor,
          leading: IconButton(
            onPressed: () {
              Get.back(result: 0);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.white,
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerWidget(),
            SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 10; i++)
                  InkWell(
                    onTap: () {
                      Get.to(() => MyClassContent('All Online'),
                          transition: Transition.leftToRight);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 10),
                      child: Container(
                        width: 500,

                        decoration: BoxDecoration(
                            color: ColorPage.color1,
                            borderRadius: BorderRadius.circular(10)),

                        // width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ALL ONline'.toUpperCase(),
                                      style: GoogleFonts.kadwa(
                                        textStyle: TextStyle(
                                          color: ColorPage.white,
                                        ),
                                      )),
                                  Obx(
                                    () => IconButton(
                                        onPressed: () {
                                          get_obj.dropbuttonvalueshow.value =
                                              !get_obj
                                                  .dropbuttonvalueshow.value;
                                        },
                                        icon: Icon(
                                          get_obj.dropbuttonvalueshow.value
                                              ? Icons.arrow_drop_up_outlined
                                              : Icons.arrow_drop_down_outlined,
                                          color: ColorPage.white,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible: get_obj.dropbuttonvalueshow.value,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 175, 178, 180),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.values[5],
                                        children: [
                                          Text.rich(TextSpan(
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      color: ColorPage.color1,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              text: 'TOTAL VIDEO:',
                                              children: const <InlineSpan>[
                                                TextSpan(
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 22, 131),
                                                    ),
                                                    text: '8')
                                              ])),
                                          Text.rich(TextSpan(
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      color: ColorPage.color1,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              text: 'DURATION:',
                                              children: const <InlineSpan>[
                                                TextSpan(
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 3, 22, 131)),
                                                    text: '04:06:57')
                                              ])),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.values[5],
                                        children: [
                                          Text.rich(TextSpan(
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      color: ColorPage.color1,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              text: 'View limit:',
                                              children: const <InlineSpan>[
                                                TextSpan(
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 3, 22, 131)),
                                                    text: ' 00:00:01')
                                              ])),
                                          Text.rich(TextSpan(
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      color: ColorPage.color1,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              text: 'Expiry date:',
                                              children: const <InlineSpan>[
                                                TextSpan(
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 3, 22, 131)),
                                                    text: '2026-08-31')
                                              ])),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            )
                //  Container(
                //   color: ColorPage.bgcolor,
                //   alignment: Alignment.topLeft,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       for (int i = 0; i < 10; i++)
                //         Padding(
                //           padding: const EdgeInsets.only(
                //               left: 5, right: 30, top: 20),
                //           child: InkWell(
                //               onTap: () {
                //                 Get.to(() => MyClassContent(widget.optionname),
                //                     transition: Transition.leftToRight);
                //               },
                //               child: const ButtonWidget()),
                //         )
                //     ],
                //   ),
                // ),

                ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                color: ColorPage.color1,
                child: const Column(
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
