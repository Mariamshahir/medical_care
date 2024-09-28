import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class PreviousSteps extends StatelessWidget {
  final String? previousStep;
  final String namePreviousStep;
  final IconData? icon;
  final VoidCallback? onTap;

  const PreviousSteps({
    super.key,
    this.icon,
    this.onTap,
    this.previousStep,
    required this.namePreviousStep,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else if (previousStep != null) {
          Navigator.pushNamed(context, previousStep!);
        }
      },
      child: Container(
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
            Icon(
              icon,
              color: AppColors.white,
              size: 30,
            ),
            const Spacer(),
            Center(
              child: Text(
                namePreviousStep,
                style: AppTheme.formtext.copyWith(color: AppColors.white),
              ),
            ),
            const Spacer(),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          ],
        ),
      ),
    );
  }
}
