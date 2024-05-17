import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/pages/utctime.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
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
      late final player = Player();
    // late final controller = VideoController(player);
    Getx getx = Get.put(Getx());
  final white = const Color.fromRGBO(250, 250, 250, 1);
  UtcTime time = UtcTime();
   late final controller = VideoController(player);

  @override
  void initState() {
    // TODO: implement initState
    // player.open(Media('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));
    super.initState();
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
                  child: Text(
                    time.utctime(),
                    style: FontFamily.font2,
                  ))
            ],
          ),
          body: Row(
            children: [
              const DrawerWidget(),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width - 1200,
                  child: const MyClassVideoContent()),


                  Obx(
              () => Expanded(
                  child: getx.videoplayer.value
                      ? Container(
                          color: Colors.black,
                        )
                      : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(width: MediaQuery.sizeOf(context).width - 1200,
                                
                                height:
                                    MediaQuery.sizeOf(context).height - 50,
                                    child: Video(controller:controller ),
                        
                        
                        
                        
                                
                                ),
                          ],
                        ),
                      )),
            )
              
            ],
          ),
        ),
      ),
    );
  }
}
