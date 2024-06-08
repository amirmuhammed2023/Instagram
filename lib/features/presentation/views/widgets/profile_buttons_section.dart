import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/presentation/views/widgets/custom_elevated_button_icon.dart';

class ProfileButtonsSection extends StatelessWidget {
  const ProfileButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Expanded(
            child: CustomElevatedButtonIcon(
              icon: Icons.edit,
              text: "Edit profile",
              borderwidth: 1,
            ),
          ),
          SizedBox(width: 10),
          CustomElevatedButtonIcon(
            icon: Icons.logout,
            text: "Log out",
            backgroundColor: AppColors.kCurveAppBar,
            textcolor: AppColors.kBackground,
          ),
        ],
      ),
    );
  }
}
