import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logandregister/core/models/userdata_model.dart';

class CommentsModel {
  UserDataModel userData;
  String commentMessage;
  DateTime publishedDate;
  String postClickedUid;

  CommentsModel(
    this.commentMessage,
    this.publishedDate,
    this.userData,
    this.postClickedUid,
  );

  Map<String, dynamic> toMap() {
    return {
      "commentmessage": commentMessage,
      "publisheddate": publishedDate,
      "userdata": userData.toMap(),
      "postclickeduid": postClickedUid,
    };
  }

  CommentsModel fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return CommentsModel(
      data!["commentmessage"],
      data["publisheddate"],
      userData.fromJson(data['userdata']),
      data["postclickeduid"],
    );
  }
}
