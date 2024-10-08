import 'package:flutter/material.dart';
import 'package:medical_care/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle title = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w700, fontFamily: "Poppins");
  static const TextStyle form = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Poppins");
  static const TextStyle formtext = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      color: AppColors.gray,
      fontFamily: "Poppins");
  static const TextStyle titleTabs = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
      overflow: TextOverflow.ellipsis);
  static const TextStyle tabs = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");
  static const TextStyle counter = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins");
  static const TextStyle name = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: "Poppins");
  static const TextStyle dialog = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500);
}
