import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/core/models/userdata_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logandregister/core/utils/functions/error_snackbar.dart';
import 'package:logandregister/core/utils/functions/succefully_snackbar.dart';

class MyFireAuth {
  final auth = FirebaseAuth.instance;
  static CollectionReference storeusers =
      FirebaseFirestore.instance.collection("userdata1");
  //Map<String, dynamic> userData = {};
  UserDataModel currentUserData = UserDataModel("", "", "", "", "", [], [], 0);

  registerandstoredata({
    required UserDataModel userdata,
    required context,
    required String gotopage,
  }) async {
    try {
      final create = await auth.createUserWithEmailAndPassword(
        email: userdata.email.trim(),
        password: userdata.password.trim(),
      );

      userdata.uid = create.user!.uid;

      storeusers
          .doc(create.user!.uid)
          .set(userdata.toMap())
          .then((value) => log("User Added"))
          .catchError((error) => log("failed to store user : $error"));

      successfullySnackbar(context, "E-mail successfully created");

      Navigator.pushReplacementNamed(context, gotopage);
    } on FirebaseAuthException catch (e) {
      errorsnackbar(context, e);
    } catch (e) {
      log(e.toString());
    }
  }

  /* Future<Map<String, dynamic>> getData(String userid) async {
    userData.clear();
    DocumentSnapshot<Map<String, dynamic>> snapshot = await storeusers
        .doc(userid)
        .get() as DocumentSnapshot<Map<String, dynamic>>;
    log("fire map : ${userData.toString()}");
    userData = snapshot.data()!;
    return userData;
  }*/

  // Future<UserDataModel> getMyData() async {
  //   DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
  //       .instance
  //       .collection("userdata1")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   return UserDataModel.fromJson(snap);
  // }

  Future<UserDataModel> getUserData(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap = await storeusers
        .doc(uid)
        .get() as DocumentSnapshot<Map<String, dynamic>>;
    log(snap.toString());
    return currentUserData.fromJson(snap);
  }

  logindata({
    required String email,
    required String password,
    required String gotopage,
    required context,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, gotopage);
    } on FirebaseAuthException catch (e) {
      errorsnackbar(context, e);
    } catch (e) {
      log(e.toString());
    }
  }

  logoutemail({required context, required String gotopage}) async {
    await auth.signOut();
    Navigator.pushReplacementNamed(context, gotopage);
  }
}
