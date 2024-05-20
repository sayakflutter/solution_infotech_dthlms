import 'package:dthlms/color/color.dart';
import 'package:dthlms/font/font_family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MobileHomepage extends StatefulWidget {
  const MobileHomepage({super.key});

  @override
  State<MobileHomepage> createState() => _MobileHomepageState();
}

class _MobileHomepageState extends State<MobileHomepage> {
  late double screenwidth = MediaQuery.of(context).size.width;
  double? size = 80;
  double? hight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("homepage"),),
      backgroundColor: ColorPage.appbarcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            SingleChildScrollView(
              child: Container(
                width: screenwidth,
                height: 800,
                decoration: BoxDecoration(
                  color: ColorPage.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Container(
                          // color: ColorPage.appbarcolor,
                          height: hight,
                          width: screenwidth / 2.3,
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
                                      'assets/online-learning.png',
                                      width: size,
                                      color: Colors.white,
                                    ),
                                  ),
                                  
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                        
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class BottomSheetWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: <Widget>[
//             Text('Scrollable Bottom Sheet'),
//             SizedBox(height: 20),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: 20,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text('Item $index'),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
