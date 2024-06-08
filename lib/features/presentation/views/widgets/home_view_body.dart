import 'package:flutter/material.dart';
import 'package:logandregister/core/models/postdata_model.dart';
import 'package:logandregister/features/presentation/views/widgets/post_information_section.dart';
import 'package:logandregister/features/presentation/views/widgets/post_tools_section.dart';
import 'package:logandregister/features/presentation/views/widgets/user_information.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.postInformation,
    required this.commentsNumber,
  });
  final PostDataModel postInformation;
  final int commentsNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInformation(
            userName: postInformation.userName,
            dateTime: postInformation.date,
            postUid: postInformation.uid,
            emailUid: postInformation.emailUid,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              postInformation.description,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            width: double.infinity,
            child: Image.network(
              postInformation.imgLink,
              fit: BoxFit.cover,
            ),
          ),
          PostToolsSection(
            postUid: postInformation.uid,
            likesList: postInformation.likes,
          ),
          PostInformationSection(
            postUid: postInformation.uid,
            likes: postInformation.likes,
            commentsNumber: commentsNumber,
          ),
        ],
      ),
    );
  }
}
