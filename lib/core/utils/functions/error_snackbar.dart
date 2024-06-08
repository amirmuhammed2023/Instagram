import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/custom_snackbar.dart';

void errorsnackbar(context, FirebaseAuthException e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomErrorSnackbar(errmessage: e.code),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}

void errorMsgSnackbar(context, String errorMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomErrorSnackbar(errmessage: errorMsg),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}
