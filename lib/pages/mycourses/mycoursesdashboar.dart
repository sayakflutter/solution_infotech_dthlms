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

  Getx getx = Get.put(Getx());
  final white = const Color.fromRGBO(250, 250, 250, 1);
  UtcTime time = UtcTime();

  final playable = Playlist(
    [
      Media(
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
      Media(
          'https://user-images.githubusercontent.com/28951144/229373709-603a7a89-2105-4e1b-a5a5-a6c3567c9a59.mp4'),
      Media(
          'https://user-images.githubusercontent.com/28951144/229373716-76da0a4e-225a-44e4-9ee7-3e9006dbc3e3.mp4'),
      Media(
          'https://user-images.githubusercontent.com/28951144/229373718-86ce5e1d-d195-45d5-baa6-ef94041d0b90.mp4'),
      Media(
          'https://user-images.githubusercontent.com/28951144/229373720-14d69157-1a56-4a78-a2f4-d7a134d7c3e9.mp4'),
    ],
    // Declare the starting position.
    index: 0,
  );
  late final controller = VideoController(player);

  @override
  void initState() {
    print(controller);
    player.open(
      playable,
      play: false,
    );

    player.setVolume(100);
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    // TODO: implement dispose
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
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        // width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height - 50,
                        child: Video(
                          // fit: BoxFit.fill,
                          controller: controller,

                          // aspectRatio: 30,
                          // controls: (state) {
                          //   return Dialog(
                          //     child: Text('Video'),
                          //   );
                          // },
                          fill: Colors.black,
                          // onEnterFullscreen: () {
                          //   return Future(() => null);
                          // },
                        )),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
