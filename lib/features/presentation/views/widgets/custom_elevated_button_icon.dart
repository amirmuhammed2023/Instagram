import 'package:flutter/material.dart';

class CustomElevatedButtonIcon extends StatelessWidget {
  const CustomElevatedButtonIcon({
    super.key,
    required this.icon,
    required this.text,
    this.backgroundColor,
    this.borderwidth = 0,
    this.textcolor,
  });
  final IconData icon;
  final String text;
  final Color? backgroundColor, textcolor;
  final double? borderwidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: textcolor),
        label: Text(
          text,
          style: TextStyle(color: textcolor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: borderwidth!),
          ),
        ),
      ),
    );
  }
}
