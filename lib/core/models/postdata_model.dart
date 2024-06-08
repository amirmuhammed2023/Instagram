import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logandregister/core/models/comments_model.dart';

class PostDataModel {
  String imgLink;
  String userName;
  String description;
  DateTime date;
  List likes;
  String uid;
  String emailUid;
  List<CommentsModel> postComments;

  PostDataModel(
    this.userName,
    this.description,
    this.imgLink,
    this.date,
    this.likes,
    this.uid,
    this.emailUid,
    this.postComments,
  );

  Map<String, dynamic> toMap() {
    return {
      "imgLink": imgLink,
      "username": userName,
      "description": description,
      "uid": uid,
      "likes": likes,
      "date": date,
      'emailUid': emailUid,
      'postComments': postComments,
    };
  }

  PostDataModel fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return PostDataModel(
      data!["username"],
      data["description"],
      data["imgLink"],
      data["date"],
      data["likes"],
      data["uid"],
      data['emailUid'],
      data['postComments'],
    );
  }
}
