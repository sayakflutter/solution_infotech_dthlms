import 'package:dthlms/main.dart';

class GoogleSignup {
  Future signin() async {
    var user = await googleSignIn.signIn();
    print(user?.email);
    await googleSignIn.signOut();
  }

  Future signout() async {
    await googleSignIn.signOut();
  }
}
