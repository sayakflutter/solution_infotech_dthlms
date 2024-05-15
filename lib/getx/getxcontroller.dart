import 'package:get/get.dart';

import '../login/loginmodel.dart';

class Getx extends GetxController {
  RxBool show = false.obs;
  RxBool hide = true.obs;
  // ignore: non_constant_identifier_names
  RxInt page_index = 0.obs;
  RxBool buttonfocuscolor = false.obs;
  RxBool dropbuttonvalueshow = true.obs;

  RxList<DthloginUserDetails> loginuserdata = <DthloginUserDetails>[].obs;
  RxBool otplineshow = false.obs;
  // RxBool otpshow = false.obs;
  RxBool loginpasswordshow = false.obs;
  RxBool signuppasswordshow = false.obs;
  RxString signupotp = ''.obs;
  RxBool forgetpassword1 = false.obs;
  RxBool forgetpassword2 = false.obs;
  RxBool pdfview = true.obs;
}
