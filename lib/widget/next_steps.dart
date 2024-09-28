import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class NextSteps extends StatelessWidget {
  final String? nextStep;
  final String nameNextStep;
  final IconData? icon;
  final VoidCallback? onTap;

  const NextSteps({
    super.key,
    this.nextStep,
    required this.nameNextStep,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else if (nextStep != null) {
          Navigator.pushNamed(context, nextStep!);
        }
      },      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Text(
                nameNextStep,
                style: AppTheme.formtext.copyWith(color: AppColors.white),
              ),
            ),
            const Spacer(),
            Icon(
              icon,
              color: AppColors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          ],
        ),
      ),
    );
  }
}
