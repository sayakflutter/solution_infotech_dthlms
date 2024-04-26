import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color/color.dart';
import '../font/font_family.dart';
import '../getx/getxcontroller.dart';
import 'myclass/myclassDashboard.dart';
import 'study/studydashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final getobj = Get.put(Getx());
  List pages = [];
  @override
  void initState() {
    pages = [
      MyClassDashboard('My Courses'),
      StudyDashboard(),
      MyClassDashboard('Live'),
      MyClassDashboard('Online Backup'),
      MyClassDashboard('Profile'),
      MyClassDashboard('MCQ'),
      MyClassDashboard('Theory Exam'),
      MyClassDashboard('Notification')
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Obx(() => Container(
              child: pages[getobj.page_index.value],
            )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(205, 197, 197, 1),
            ),
            height: 60,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          // highlightColor: Colors.red,
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 0
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 0;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/1.png',
                                width: 30,
                              ),
                              Text(
                                ' My Courses ',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 1
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 1;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/2.png',
                                width: 30,
                              ),
                              Text(
                                ' Studty Material',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 2
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 2;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/3.png',
                                width: 30,
                              ),
                              Text(
                                ' Live',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 3
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 3;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/4.png',
                                width: 30,
                              ),
                              Text(
                                ' Online Backup',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 4
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 4;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/5.png',
                                width: 30,
                              ),
                              Text(
                                'Profile ',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 5
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 5;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/6.png',
                                width: 30,
                              ),
                              Text(
                                'MCQ ',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 6
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 6;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/7.png',
                                width: 30,
                              ),
                              Text(
                                'Theory Exam ',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: 150,
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.sizeOf(context).height,
                        child: MaterialButton(
                          hoverColor: ColorPage.hovercolor,
                          color: getobj.page_index.value == 7
                              ? ColorPage.focuscolor
                              : ColorPage.color1,
                          onPressed: () {
                            getobj.page_index.value = 7;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/8.png',
                                width: 30,
                              ),
                              Text(
                                'Notification ',
                                style: FontFamily.font2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
