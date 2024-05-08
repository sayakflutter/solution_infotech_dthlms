import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/mycourses/coursescontent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  Getx get_obj = Get.put(Getx());
  double? size = 80;
  double? hight = 230;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 208, 225, 238),
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: InkWell(
                        onTap: () {
                          get_obj.page_index.value = 1;
                          Get.to(() => MyClassDashboard('My Courses'),
                                  transition: Transition.leftToRight)
                              ?.then((value) => get_obj.page_index.value = 0);
                        },
                        child: SizedBox(
                          height: hight,
                          width: 349,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(61, 140, 229, 1),
                                                Color.fromRGBO(0, 234, 255, 1)
                                              ],
                                              end: Alignment.bottomRight)),
                                      child: Image.asset(
                                        'assets/online-learning.png',
                                        width: size,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'My Courses',
                                    style: FontFamily.font,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: SizedBox(
                        height: hight,
                        width: 349,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(247, 97, 161, 1),
                                          Color.fromRGBO(140, 27, 71, 1)
                                        ], end: Alignment.bottomRight)),
                                    child: Image.asset(
                                      'assets/book.png',
                                      color: Colors.white,
                                      width: size,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Study Material',
                                  style: FontFamily.font,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: SizedBox(
                        height: hight,
                        width: 349,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(201, 84, 17, 1),
                                          Color.fromRGBO(228, 10, 2, 1)
                                        ], end: Alignment.bottomRight)),
                                    child: Image.asset(
                                      'assets/instagram-live.png',
                                      width: size,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Live',
                                  style: FontFamily.font,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: SizedBox(
                        height: hight,
                        width: 349,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(225, 8, 68, 1),
                                          Color.fromRGBO(255, 177, 153, 1)
                                        ], end: Alignment.bottomRight)),
                                    child: Image.asset(
                                      'assets/file-upload.png',
                                      width: size,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Online Backup',
                                  style: FontFamily.font,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: InkWell(
                        onTap: () {
                          get_obj.page_index.value = 5;
                          Get.to(() => Profile('Profile'),
                                  transition: Transition.leftToRight)
                              ?.then((value) => get_obj.page_index.value = 0);
                        },
                        child: SizedBox(
                          height: hight,
                          width: 349,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(17, 201, 156, 1),
                                                Color.fromRGBO(0, 227, 29, 1)
                                              ],
                                              end: Alignment.bottomRight)),
                                      child: Image.asset(
                                        'assets/user-avatar.png',
                                        width: size,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Profile',
                                    style: FontFamily.font,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: SizedBox(
                        height: hight,
                        width: 349,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(61, 140, 229, 1),
                                          Color.fromRGBO(0, 234, 255, 1)
                                        ], end: Alignment.bottomRight)),
                                    child: Image.asset(
                                      'assets/exam.png',
                                      width: size,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'MCQ',
                                  style: FontFamily.font,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: SizedBox(
                        height: hight,
                        width: 349,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(61, 140, 229, 1),
                                          Color.fromRGBO(0, 234, 255, 1)
                                        ], end: Alignment.bottomRight)),
                                    child: Image.asset(
                                      'assets/file.png',
                                      width: size,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Theory Exam',
                                  style: FontFamily.font,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: SizedBox(
                        height: hight,
                        width: 349,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(50, 141, 245, 1),
                                          Color.fromRGBO(8, 101, 241, 1)
                                        ], end: Alignment.bottomRight)),
                                    child: Image.asset(
                                      'assets/notification.png',
                                      width: size,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Notification',
                                  style: FontFamily.font,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
