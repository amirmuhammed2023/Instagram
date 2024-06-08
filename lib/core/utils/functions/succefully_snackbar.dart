import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/custom_snackbar.dart';

void successfullySnackbar(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomSuccessSnackbar(successmessage: msg),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
