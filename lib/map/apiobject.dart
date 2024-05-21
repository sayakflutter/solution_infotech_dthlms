class ClsMap
{
  static Map objLoginApi( String loginemail,
  String password,
  String otp,) {
    return {     'userName': loginemail,
    'password': password,
    'franchiseId': 1};
}

 static Map objSignupApi(String signupuser, String signupname,
    signupemail, signuppassword, signupphno, key, otp) {
    return {
      'userName': signupuser,
      'password': signuppassword,
      'franchiseId': 1,
      'phoneNumber': signupphno,
      'firstName': signupname,
      'lastName': 'x',
      'email': signupemail,
      'emailCode': otp,
      'phoneNumberCode': '2620036',
    };
}

}