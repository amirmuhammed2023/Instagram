import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_post_data_provider.dart';
import 'package:provider/provider.dart';

Future<dynamic> customAlertDialog(
  BuildContext context, {
  required String postUserUid,
  required String postUid,
}) {
  final getPostInstance =
      Provider.of<GettedPostDataProvider>(context, listen: false);
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel'),
          ),
          Visibility(
            visible: FirebaseAuth.instance.currentUser!.uid == postUserUid,
            child: TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await getPostInstance.deleteMyPost(postUid: postUid);
              },
              child: const Text('Delete'),
            ),
          ),
        ],
        title: FirebaseAuth.instance.currentUser!.uid == postUserUid
            ? const Text(
                "Are you sure , you want to delete post?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              )
            : const Text(
                "Sorry , you can't delete this post 😞",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
      );
    },
  );
}
