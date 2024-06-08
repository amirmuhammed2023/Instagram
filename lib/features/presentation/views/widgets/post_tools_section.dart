import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_post_data_provider.dart';
import 'package:logandregister/features/presentation/views/comments_view.dart';
import 'package:provider/provider.dart';

class PostToolsSection extends StatelessWidget {
  const PostToolsSection(
      {super.key, required this.postUid, required this.likesList});
  final String postUid;
  final List likesList;
  @override
  Widget build(BuildContext context) {
    final postInstance = Provider.of<GettedPostDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () async {
                await postInstance.changeLoveStatus(
                  postUid: postUid,
                  likesList: likesList,
                );
              },
              icon: likesList.contains(FirebaseAuth.instance.currentUser!.uid)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
            ),
            IconButton(
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  CommentsView.id,
                  arguments: {
                    'postUid': postUid,
                    'boolean': true,
                  },
                );
              },
              icon: const Icon(Icons.message_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_border),
        )
      ],
    );
  }
}
