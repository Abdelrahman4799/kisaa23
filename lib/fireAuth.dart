import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FireAuth {


  static Future<User?> signInUsingEmailPassword({
  required String email,
  required String password,
}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
    } else if (e.code == 'wrong-password') {
      if (kDebugMode) {
        print('Wrong password provided.');
      }
    }
  }

  return user;
}




   
}