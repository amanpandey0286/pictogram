import 'dart:developer' as dev;
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pictogram/models/user_model.dart';
import 'package:pictogram/services/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerUser({
    required String email,
    required String password,
    required String name,
    required String bio,
    required Uint8List file,
  }) async {
    try {
      final UserCredential _cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String photoUrl =
          await StorageMethods().uploadFile('profilePics', file, false);

      UserModel userModel = UserModel(
        email: email,
        uid: _cred.user!.uid,
        username: name,
        photoUrl: photoUrl,
        bio: bio,
        followers: [],
        following: [],
      );

      _firestore
          .collection('users')
          .doc(_cred.user!.uid)
          .set(userModel.toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else if (e.code == 'The email address is badly formatted') {
        return 'Please enter correct email address.';
      } else {
        print(e);
        return 'error ocurred';
      }
    } catch (e) {
      return e.toString();
    }
    return 'Success';
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return 'error ocurred';
      }
    } catch (e) {
      throw e.toString();
    }
    return 'Success';
  }
}
