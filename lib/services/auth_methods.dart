import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void registerUser({
    required String email,
    required String password,
    required String name,
    required String bio,
  }) async {
    if (email.isNotEmpty ||
        password.isNotEmpty ||
        name.isNotEmpty ||
        bio.isNotEmpty) {
      try {
        final UserCredential _cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        _firestore.collection('users').doc(_cred.user!.uid).set({
          'name': name,
          'email': email,
          'uid': _cred.user!.uid,
          'bio': bio,
          'followers': [],
          'following': [],
        });
      } catch (e) {
        dev.log(e.toString());
      }
    }
  }
}
