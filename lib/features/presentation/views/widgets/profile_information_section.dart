import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:provider/provider.dart';

class ProfileInformationSection extends StatelessWidget {
  const ProfileInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final getDataInstance = Provider.of<GettedUserDataProvider>(context);
    // final getDataInstance =
    //     Provider.of<UserDataProvider>(context).getUserDataModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: Image.asset("assets/images/images.png"),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.12),
              Column(
                children: [
                  Text(
                    getDataInstance.postNumber.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Posts",
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    "${getDataInstance.gettedUserData!.followers.length}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text("Followers"),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    "${getDataInstance.gettedUserData!.following.length}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text("Following"),
                ],
              )
            ],
          ),
          const SizedBox(height: 25),
          const Text("Cute & nice"),
        ],
      ),
    );
  }
}
