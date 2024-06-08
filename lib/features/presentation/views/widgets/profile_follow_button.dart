import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';

class ProfileFollowButton extends StatelessWidget {
  const ProfileFollowButton(
      {super.key,
      required this.currentUid,
      required this.onPressed,
      required this.isFollow});
  final String currentUid;
  final void Function() onPressed;
  final bool isFollow;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: isFollow == true
              ? AppColors.errorsnackcolor
              : AppColors.kBorderTextField,
        ),
        child: Text(
          isFollow == true ? "Unfollow" : "Follow",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
