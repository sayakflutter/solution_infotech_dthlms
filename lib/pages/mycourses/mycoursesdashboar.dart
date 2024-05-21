import 'package:dthlms/ThemeData/FontSize/FontSize.dart';
import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/pages/utctime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../widget/drawerWidget.dart';
import 'myclasscontentvideo/myclasscontentvideo.dart';

// ignore: must_be_immutable
class MyClassContent extends StatefulWidget {
  String optionname;

  MyClassContent(this.optionname, {super.key});

  @override
  State<MyClassContent> createState() => _MyClassContentState();
}

class _MyClassContentState extends State<MyClassContent>
    with TickerProviderStateMixin {
  Getx getx = Get.put(Getx());
  final white = const Color.fromRGBO(250, 250, 250, 1);
  UtcTime time = UtcTime();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 1,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: ColorPage.bgcolor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorPage.white,
                )),
            titleTextStyle:  TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize:ClsFontsize.Small ),//20
            backgroundColor: ColorPage.appbarcolor,
            title: Row(
              children: [
                Text(
                  '${widget.optionname}  ',
                  textScaler: const TextScaler.linear(1.7),
                  style: FontFamily.font2,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorPage.white,
                ),
                Text(
                  '   All in one Videos',
                  textScaler: const TextScaler.linear(1.7),
                  style: FontFamily.font2,
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  time.utctime(),
                  style: FontFamily.font2,
                ),
              )
            ],
          ),
          body: Row(
            children: [
              const DrawerWidget(),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width - 1150,
                  // height: 1000,
                  child: const MyClassVideoContent()),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
