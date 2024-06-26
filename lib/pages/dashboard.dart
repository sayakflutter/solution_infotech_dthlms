import 'package:dthlms/ThemeData/FontSize/FontSize.dart';
import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/home/homepage.dart';
import 'package:dthlms/pages/utctime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/drawerWidget.dart';

class Dashboard extends StatefulWidget {
  late final dbdata;
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UtcTime time = UtcTime();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Text(
              time.utctime(),
              style: FontFamily.font2,
            ),
            IconButton(
                tooltip: 'Profile',
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: ColorPage.white,
                )),
            IconButton(
                tooltip: 'Support',
                onPressed: () {},
                icon: const Icon(
                  Icons.support_agent,
                  color: ColorPage.white,
                )),
            IconButton(
                tooltip: 'Logout',
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: ColorPage.white,
                ))
          ],
          backgroundColor: ColorPage.appbarcolor,
          title: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hi, Sayak Mishra',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ClsFontsize.Small), //20
              ),
            ),
          ),
          titleTextStyle: FontFamily.font2,
        ),
        body: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerWidget(),
            Expanded(
              child: HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}
