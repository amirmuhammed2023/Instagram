import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: AppColors.kCurveAppBar,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.kBackground,
          ),
        ),
      ),
    );
  }
}
