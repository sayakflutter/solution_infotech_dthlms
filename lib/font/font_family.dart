import 'package:dthlms/ThemeData/FontSize/FontSize.dart';
import 'package:dthlms/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamily {
  static var font = GoogleFonts.outfit(
      textStyle: TextStyle(
          color: ColorPage.colorgrey,
          fontSize: ClsFontsize.Small,
          fontWeight: FontWeight.bold));
  static var font2 = GoogleFonts.outfit(
      textStyle: TextStyle(
          color: ColorPage.white, fontSize: ClsFontsize.ExtraSmall, fontWeight: FontWeight.bold));
  static var mobilefont = GoogleFonts.outfit(
      textStyle: TextStyle(
          color: ColorPage.colorgrey,
          fontSize: ClsFontsize.ExtraSmall,
          fontWeight: FontWeight.bold));

  static var font3 = GoogleFonts.outfit(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: ClsFontsize.ExtraSmall,
  ));

  static var font4 = GoogleFonts.outfit(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: ClsFontsize.ExtraSmall,
  ));
}
