import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> SignUpAuth({
    required String email,
    required String username,
    required String password,
    required String about,
  }) async {
    String res = "Sorry, Error occured";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          about.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // store user

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'email': email,
          'username': username,
          'uid': cred.user!.uid,
          'about': about,
        });

        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> LoginAuth({required email, required password}) async {
    String res = 'Sorry Error Occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = "Pls enter all fields";
      }
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'user-not-found') {}
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
