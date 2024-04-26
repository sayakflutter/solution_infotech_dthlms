import 'package:flutter/material.dart';

import '../../color/color.dart';
import '../../font/font_family.dart';
import '../../widget/buttonwidget.dart';

// ignore: must_be_immutable
class MyClassDashboard extends StatefulWidget {
  late String name;
  MyClassDashboard(this.name, {super.key}) {
    print(name);
  }

  @override
  State<MyClassDashboard> createState() => _MyClassDashboardState();
}

class _MyClassDashboardState extends State<MyClassDashboard> {
  final obj = const ButtonWidget();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPage.color1,
          centerTitle: true,
          title: Text(
            widget.name.toUpperCase(),
            style: FontFamily.font2,
            textScaler: const TextScaler.linear(1.4),
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 10; i++)
                        const Padding(
                          padding: EdgeInsets.only(left: 5, right: 30, top: 20),
                          child: ButtonWidget(),
                        )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                // height: MediaQuery.sizeOf(context).height - 130,
                color: Colors.black,
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
