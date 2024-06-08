import 'package:flutter/material.dart';

class ProfilePostImage extends StatelessWidget {
  const ProfilePostImage({super.key, required this.imgLink});
  final String imgLink;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imgLink,
        fit: BoxFit.cover,
      ),
    );
  }
}
