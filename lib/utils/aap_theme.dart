import 'package:flutter/material.dart';
import 'package:medical_care/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle title =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w700);
  static const TextStyle form =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const TextStyle formtext = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.gray);
  static const TextStyle titleTabs = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis);
  static const TextStyle tabs = TextStyle(
      color: AppColors.primaryColor, fontSize: 15, fontWeight: FontWeight.w500);
  static const TextStyle counter = TextStyle(
      color: AppColors.primaryColor, fontSize: 30, fontWeight: FontWeight.w600);
  static const TextStyle name = TextStyle(
      color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.w700);
}
