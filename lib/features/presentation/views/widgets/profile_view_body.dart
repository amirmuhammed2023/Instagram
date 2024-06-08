import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_body_section.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_button_task_section.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_information_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.currentUid});
  final String currentUid;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileInformationSection(),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        const Divider(thickness: 1),
        const SizedBox(height: 10),
        ProfileButtonTaskSection(currentUid: currentUid),
        const SizedBox(height: 10),
        const Divider(thickness: 1),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        ProfileBodySection(currentUid: currentUid),
      ],
    );
  }
}
