import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/presentation/views/comments_view.dart';

class PostInformationSection extends StatelessWidget {
  const PostInformationSection({
    super.key,
    required this.likes,
    required this.commentsNumber,
    required this.postUid,
  });
  final List likes;
  final int commentsNumber;
  final String postUid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            likes.isEmpty || likes.length == 1
                ? "${likes.length.toString()} Like"
                : "${likes.length.toString()} Likes",
            style: const TextStyle(color: AppColors.kCurveAppBar),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Text(
                "Amir ",
                style: TextStyle(color: Colors.red),
              ),
              Text(
                "love that",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                CommentsView.id,
                arguments: {
                  'postUid': postUid,
                  'boolean': false,
                },
              );
            },
            child: commentsNumber == 0
                ? const Text(
                    "No Comments",
                    style: TextStyle(color: AppColors.kCurveAppBar),
                  )
                : Text(
                    "View all $commentsNumber comments",
                    style: const TextStyle(color: AppColors.kCurveAppBar),
                  ),
          ),
        ],
      ),
    );
  }
}
