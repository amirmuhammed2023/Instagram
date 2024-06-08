import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/core/models/userdata_model.dart';
import 'package:logandregister/features/data/my_fire_auth.dart';
import 'package:logandregister/features/data/my_fire_storage.dart';

class GettedUserDataProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isfollow = false;
  int postNumber = 0;

  final MyFireAuth getDataFromFire;
  //final MyFireStorage getPostFromFire;

  UserDataModel? _userDataProv;
  UserDataModel? get gettedUserData => _userDataProv;
  // int followers = 0;
  // int following = 0;
  // PostDataModel? _postDataModel;
  // PostDataModel? get gettedPost => _postDataModel;

  GettedUserDataProvider(this.getDataFromFire);

  getUserDataFi(String uid) async {
    isLoading = true;
    log("inloading my id is :  $uid");
    UserDataModel userData = await getDataFromFire.getUserData(uid);
    await getPostNumber(uid);
    userData.posts = postNumber;
    _userDataProv = userData;
    isLoading = false;
    notifyListeners();
  }

  getPostNumber(String uid) async {
    var emailPosts =
        await MyFireStorage.storePosts.where('emailUid', isEqualTo: uid).get();
    postNumber = emailPosts.docs.length;
    notifyListeners();
  }

  isFollowhim(String uid) async {
    UserDataModel userData = await getDataFromFire.getUserData(uid);
    if (userData.following.contains(FirebaseAuth.instance.currentUser!.uid)) {
      isfollow = true;
    } else {
      isfollow = false;
    }
    log(isfollow.toString());
    notifyListeners();
  }

  followTab(String uid) async {
    await MyFireAuth.storeusers.doc(uid).update(
      {
        'followers':
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
      },
    );

    await MyFireAuth.storeusers
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        'following': FieldValue.arrayUnion([uid]),
      },
    );
    await followingStatus(uid);
    notifyListeners();
  }

  unfollowTap(String uid) async {
    await MyFireAuth.storeusers.doc(uid).update(
      {
        'followers':
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid]),
      },
    );

    await MyFireAuth.storeusers
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        'following': FieldValue.arrayRemove([uid]),
      },
    );
    await followingStatus(uid);
    notifyListeners();
  }

  followingStatus(String uid) async {
    UserDataModel userData = await getDataFromFire.getUserData(uid);
    _userDataProv = userData;
    isfollow = !isfollow;
    notifyListeners();
  }
}
