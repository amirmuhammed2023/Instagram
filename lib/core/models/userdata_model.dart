import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  String firstname;
  String lastname;
  String email;
  String password;
  String uid;
  List following;
  List followers;
  int posts;

  UserDataModel(
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.uid,
    this.followers,
    this.following,
    this.posts,
  );

  Map<String, dynamic> toMap() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "password": password,
      "uid": uid,
      "following": [],
      "followers": [],
      'posts': 0,
    };
  }

  UserDataModel fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    return UserDataModel(
      data!['firstname'],
      data['lastname'],
      data['email'],
      data['password'],
      data['uid'],
      data['following'],
      data['followers'],
      data['posts'],
    );
  }
}
