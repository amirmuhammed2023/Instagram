import 'package:flutter/material.dart';
import 'package:logandregister/core/models/comments_model.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_post_data_provider.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:logandregister/features/presentation/views/widgets/comment_real_time_data_section.dart';
import 'package:logandregister/features/presentation/views/widgets/comments_message_field.dart';
import 'package:provider/provider.dart';

class CommentsViewBody extends StatefulWidget {
  const CommentsViewBody({super.key});
  @override
  State<CommentsViewBody> createState() => _CommentsViewBodyState();
}

class _CommentsViewBodyState extends State<CommentsViewBody> {
  late TextEditingController messageController;
  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getDataInstance = Provider.of<GettedUserDataProvider>(context);
    final getCommentInstance = Provider.of<GettedPostDataProvider>(context);
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommentRealTimeDataSection(currentPostUid: arguments['postUid']),
        Visibility(
          visible: arguments['boolean'],
          child: CommentsMessageField(
            controller: messageController,
            hintText: "Write a comment ...",
            onPressedIcon: () async {
              await getCommentInstance.addComment(
                CommentsModel(
                  messageController.text,
                  DateTime.now(),
                  getDataInstance.gettedUserData!,
                  arguments['postUid'],
                ),
              );
              messageController.clear();
            },
            icon: Icons.send,
          ),
        ),
      ],
    );
  }
}
