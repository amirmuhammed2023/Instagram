import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/core/utils/functions/custom_alert_dialog.dart';

class UserInformation extends StatelessWidget {
  const UserInformation(
      {super.key,
      required this.userName,
      required this.dateTime,
      required this.postUid,
      required this.emailUid});
  final String userName;
  final DateTime dateTime;
  final String postUid;
  final String emailUid;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        userName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(dateTime),
        style: const TextStyle(color: AppColors.kBorderTextField, fontSize: 12),
      ),
      trailing: InkWell(
        onTap: () {
          customAlertDialog(context, postUid: postUid, postUserUid: emailUid);
        },
        child: const Icon(
          Icons.delete_forever,
          color: AppColors.errorsnackcolor,
          size: 26,
        ),
      ),
      leading: CircleAvatar(
        radius: 30,
        child: Image.asset("assets/images/images.png"),
      ),
    );
  }
}
