import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_buttons_section.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_follow_button_section.dart';

class ProfileButtonTaskSection extends StatelessWidget {
  const ProfileButtonTaskSection({super.key, required this.currentUid});
  final String currentUid;
  @override
  Widget build(BuildContext context) {
    return currentUid == FirebaseAuth.instance.currentUser!.uid
        ? const ProfileButtonsSection()
        : ProfileFollowButtonSection(currentUid: currentUid);
  }
}
