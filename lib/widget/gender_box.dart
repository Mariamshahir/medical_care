import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class GenderBox extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function(bool isSelected) onSelect;
  final bool isSelected;

  const GenderBox(
      {super.key,
      required this.name,
      required this.icon,
      required this.onSelect,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(!isSelected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          border: Border.all(
            color: AppColors.green,
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
              color: AppColors.green,
              size: 30,
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: AppTheme.formtext.copyWith(
                  color: isSelected ? AppColors.white : AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
