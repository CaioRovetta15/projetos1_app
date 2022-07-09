// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await _googleSignIn.signIn();
  }
  logout() async {
    googleAccount.value = await _googleSignIn.signOut();
  }
}
