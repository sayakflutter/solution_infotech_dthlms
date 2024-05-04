import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../color/color.dart';

class MyClassVideoContent extends StatefulWidget {
  const MyClassVideoContent({super.key});

  @override
  State<MyClassVideoContent> createState() => _MyClassVideoContentState();
}

class _MyClassVideoContentState extends State<MyClassVideoContent> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: ColorPage.bgcolor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(152, 150, 138, 1),
                              fontSize: 15),
                          hintText: 'Search',
                          fillColor: ColorPage.white,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/folder.png',
                        width: 50,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/google-drive.png',
                        width: 50,
                      ))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width,
                      child: Text(
                        'Class Lecture - Toady - TVM',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ),
                    ),
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: ColorPage.white,
                          surfaceTintColor: ColorPage.white,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          // elevation: 0,
                          child: ListTile(
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.download_for_offline_sharp,
                                  color: Color.fromRGBO(19, 23, 36, 1),
                                )),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
