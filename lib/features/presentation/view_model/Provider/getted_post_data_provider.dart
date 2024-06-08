import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/core/models/comments_model.dart';
import 'package:logandregister/core/models/postdata_model.dart';
import 'package:logandregister/features/data/my_fire_storage.dart';

class GettedPostDataProvider extends ChangeNotifier {
  final MyFireStorage getPost;
  // PostDataModel? _postDataProv;
  // PostDataModel? get gettedPostData => _postDataProv;
  GettedPostDataProvider(this.getPost);

  // getPostDataFi(String uid) async {
  //   PostDataModel postData = await getPost.getPostData(uid);
  //   _postDataProv = postData;
  //   notifyListeners();
  // }

  addNewPost(PostDataModel postData) async {
    await getPost.newPost(postData: postData);
    notifyListeners();
  }

  addComment(CommentsModel commentData) async {
    await getPost.newComment(commentData: commentData);
    notifyListeners();
  }

  changeLoveStatus({required String postUid, required List likesList}) async {
    if (likesList.contains(FirebaseAuth.instance.currentUser!.uid)) {
      await getPost.unLovelyTap(postUid: postUid);
    } else {
      await getPost.lovelyTap(postUid: postUid);
    }
    notifyListeners();
  }

  deleteMyPost({required String postUid}) async {
    // if (FirebaseAuth.instance.currentUser!.uid == postUserUid) {
    await getPost.deletePost(postUid: postUid);
    // } else {}
    notifyListeners();
  }
}
