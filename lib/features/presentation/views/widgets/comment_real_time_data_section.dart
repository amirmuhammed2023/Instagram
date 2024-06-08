import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/custom_snackbar.dart';
import 'package:logandregister/features/presentation/views/widgets/comment_tile_section.dart';
import 'package:logandregister/features/presentation/views/widgets/custom_circule_indicator.dart';

class CommentRealTimeDataSection extends StatelessWidget {
  const CommentRealTimeDataSection({super.key, required this.currentPostUid});
  final String currentPostUid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("postdata")
          .doc(currentPostUid)
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
        if (streamSnapshot.hasError) {
          return const CustomErrorSnackbar(
              errmessage: "Error has done in data");
        }
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return const CustomCirculeIndicator();
        }

//========================== look it again =================================================

        final DocumentSnapshot data = streamSnapshot.data!;

        final Map<String, dynamic> documentData =
            data.data() as Map<String, dynamic>;
        if (documentData['postComments'].isEmpty) {
          return const Center(child: Text("No comments"));
        }
        final List<Map<String, dynamic>> commentsListData =
            (documentData['postComments'] as List)
                .map((e) => e as Map<String, dynamic>)
                .toList();

//==========================================================================================

        return Expanded(
          child: ListView.builder(
            itemCount: commentsListData.length,
            itemBuilder: (ctx, index) {
              return CommentTileSection(
                currentComment: commentsListData[index],
              );
            },
          ),
        );
      },
    );
  }
}
