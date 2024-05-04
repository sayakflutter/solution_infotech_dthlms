import 'package:dthlms/main.dart';

class GoogleSignup {
  Future signin() async {
    // ignore: unused_local_variable
    var user = await googleSignIn.signIn();
    await googleSignIn.signOut();
  }

  Future signout() async {
    await googleSignIn.signOut();
  }
}
