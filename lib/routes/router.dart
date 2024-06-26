import 'package:dthlms/android/Homepage/MobileHomepage.dart';
import 'package:dthlms/android/login/dth_mob_login.dart';
import 'package:dthlms/login/dth_login.dart';
import 'package:dthlms/pages/dashboard.dart';
import 'package:dthlms/pages/study/studydashboard.dart';
import 'package:dthlms/showpdf/showpdf.dart';
import 'package:get/get.dart';

class pageRouter{
  List<GetPage<dynamic>>? Route =[
    GetPage(name: '/', page: ()=>DthLmsLogin()),
    GetPage(name: '/Dashboard', page: ()=>Dashboard()),
    GetPage(name: '/Pdfedit', page: ()=>PdfEdit()),
    GetPage(name: '/Studydashboard', page: ()=>StudyDashboard()),
    GetPage(name: '/Mobilelogin', page: ()=>Mobilelogin(),),
    GetPage(name: '/Mobilehomepage', page: ()=>MobileHomepage()),

  ];
     
}