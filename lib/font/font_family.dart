import 'package:dthlms/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamily {
  static var font = GoogleFonts.outfit(
      textStyle: TextStyle(
          color: ColorPage.colorgrey,
          fontSize: 25,
          fontWeight: FontWeight.bold));
  static var font2 = GoogleFonts.outfit(
      textStyle: TextStyle(
          color: ColorPage.white, fontSize: 15, fontWeight: FontWeight.w400));
  static var mobilefont = GoogleFonts.outfit(
      textStyle: TextStyle(
          color: ColorPage.colorgrey,
          fontSize: 15,
          fontWeight: FontWeight.bold));

  static var font3 = GoogleFonts.outfit(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 15,
  ));
}
