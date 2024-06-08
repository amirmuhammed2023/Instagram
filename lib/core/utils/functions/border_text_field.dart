import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';

UnderlineInputBorder kBorderTextField() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.kBorderTextField, width: 2),
  );
}

OutlineInputBorder kOutlinedBorderTextField() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.kBorderTextField, width: 2),
  );
}
