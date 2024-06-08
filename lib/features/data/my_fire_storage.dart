import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logandregister/core/models/comments_model.dart';
import 'package:logandregister/core/models/postdata_model.dart';

class MyFireStorage {
  static CollectionReference storePosts =
      FirebaseFirestore.instance.collection("postdata");
  // PostDataModel currentPostData =
  //     PostDataModel("", "", "", DateTime.now(), [], "", "", []);

  static getImageUrl(
      {required String imgName, required Uint8List imgPath}) async {
    final storageRef = FirebaseStorage.instance.ref(imgName);
    UploadTask uploadImageToFire = storageRef.putData(imgPath);
    TaskSnapshot snapshot = await uploadImageToFire;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

  newPost({required PostDataModel postData}) async {
    await storePosts
        .doc(postData.uid)
        .set(postData.toMap())
        .then((value) => log("post Added"))
        .catchError((error) => log("failed to store post : $error"));
  }

  // Future<PostDataModel> getPostData(String uid) async {
  //   DocumentSnapshot<Map<String, dynamic>> snap = await storePosts
  //       .doc(uid)
  //       .get() as DocumentSnapshot<Map<String, dynamic>>;
  //   return currentPostData.fromJson(snap);
  // }

  newComment({required CommentsModel commentData}) async {
    await storePosts.doc(commentData.postClickedUid).update({
      'postComments': FieldValue.arrayUnion([commentData.toMap()]),
    });
  }

  lovelyTap({required String postUid}) async {
    await storePosts.doc(postUid).update({
      "likes": FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
    });
  }

  unLovelyTap({required String postUid}) async {
    await storePosts.doc(postUid).update({
      "likes": FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid]),
    });
  }

  deletePost({required String postUid}) async {
    await storePosts.doc(postUid).delete();
  }

  // Future<bool> likesContainsEmail({required String postUid}) async {
  //   DocumentSnapshot<Map<String, dynamic>> snapshot = await storePosts
  //       .doc(postUid)
  //       .get() as DocumentSnapshot<Map<String, dynamic>>;

  //   return snapshot['likes'].contains(FirebaseAuth.instance.currentUser!.uid);
  // }
}
