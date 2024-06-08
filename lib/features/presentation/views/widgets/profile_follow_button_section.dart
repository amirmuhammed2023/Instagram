import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_follow_button.dart';
import 'package:provider/provider.dart';

class ProfileFollowButtonSection extends StatelessWidget {
  const ProfileFollowButtonSection({super.key, required this.currentUid});
  final String currentUid;
  @override
  Widget build(BuildContext context) {
    final getDataInstance = Provider.of<GettedUserDataProvider>(context);
    return getDataInstance.isfollow == false
        ? ProfileFollowButton(
            currentUid: currentUid,
            onPressed: () async {
              await getDataInstance.followTab(currentUid);
              // await getDataInstance.getUserDataFi(currentUid);
            },
            isFollow: false,
          )
        : ProfileFollowButton(
            currentUid: currentUid,
            onPressed: () async {
              await getDataInstance.unfollowTap(currentUid);
            },
            isFollow: true,
          );
  }
}
