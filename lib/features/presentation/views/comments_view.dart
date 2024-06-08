import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/widgets/comments_view_body.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});
  static const id = "/CommentView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: const CommentsViewBody(),
      ),
    );
  }
}
