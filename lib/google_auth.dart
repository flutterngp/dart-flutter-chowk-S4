import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth.dart';
import 'home_page.dart';

class Auth {
  FirebaseAuth authInstance = FirebaseAuth.instance;
  Stream<User?> get authState => authInstance.authStateChanges();

  Future signIn(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final cred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await authInstance.signInWithCredential(cred);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const InAppHomePage(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future siignOut(BuildContext context) async {
    try {
      await authInstance.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
