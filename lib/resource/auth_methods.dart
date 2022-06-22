import 'package:ajeo_test/model/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//sign up user

  Future<String> signUpUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    String response = "Some error Occurred";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          lastName.isNotEmpty ||
          firstName.isNotEmpty) {
        UserCredential credential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        model.User user = model.User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          uid: credential.user!.uid,
        );

        //adding user info

        await _firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
        response = "success";
      } else {
        response = 'Please enter all the fields';
      }
    } catch (error) {
      error.toString();
    }
    return response;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    String response = "Some error Occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        response = "success";
      } else {
        response = "Please enter all the fields";
      }
    } catch (error) {
      error.toString();
    }
    return response;
  }

  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
