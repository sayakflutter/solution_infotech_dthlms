import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
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
  final white = const Color.fromRGBO(250, 250, 250, 1);
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
            titleTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
                child: SizedBox(
                    width: 200,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: white,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    )),
              )
            ],
          ),
          body: Row(
            children: [
              const DrawerWidget(),
              Container(
                  width: MediaQuery.sizeOf(context).width - 1200,
                  child: MyClassVideoContent()),
              Expanded(
                child: Container(
                  color: ColorPage.color1,
                  child: const Column(
                    children: [],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
