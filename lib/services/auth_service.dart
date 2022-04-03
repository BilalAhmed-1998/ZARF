// ignore_for_file: missing_return, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zarf/services/app_user.dart';

import '../dummydata.dart';


class auth_service {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user from firebaseAUTH User//

app_user _userFromFirebase(User fuser) {
  return fuser!=null ?app_user(uid: fuser.uid) : null;

}

//auth changes user stream//

  Stream<User> get fireuser {
    return _auth.authStateChanges();
  }


  Stream<app_user> get fuser {
  return _auth.authStateChanges()
      .map(_userFromFirebase);
}


//sign in anonymously ///

Future signInAnon(context)async {

  try {
    UserCredential result = await _auth.signInAnonymously();
    User fuser = result.user;
    return _userFromFirebase(result.user);
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message)));
    return null;
  }

}

  //sign in with email password//
  Future signInWithEmailPassword(context,String email,String password)async{


  try {
    dynamic result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(result.user);


  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message)));
    return null;
  }


  }


//Sign up with email password//
  Future signUpWithEmailPassword(context,String email,String password)async{

  try {
    dynamic result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(result.user);

  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message)));
    return null;
  }

  }

// sign out //
Future signOut (context)async{

  try {
    await _auth.signOut();
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message)));
  }



}


}