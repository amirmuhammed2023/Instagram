import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/core/utils/functions/border_text_field.dart';

class CommentsMessageField extends StatelessWidget {
  const CommentsMessageField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onPressedIcon,
      required this.icon});
  final TextEditingController controller;
  final String hintText;
  final void Function() onPressedIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onPressedIcon,
            icon: Icon(icon),
            color: AppColors.kCurveAppBar,
          ),
          enabledBorder: kOutlinedBorderTextField(),
          focusedBorder: kOutlinedBorderTextField(),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.kCurveAppBar,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
