import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class ChooseDisease extends StatefulWidget {
  final String name;
  final Function(bool isSelected) onSelect;
  final bool isSelected;

  const ChooseDisease({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ChooseDiseaseState createState() => _ChooseDiseaseState();
}

class _ChooseDiseaseState extends State<ChooseDisease> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelect(!widget.isSelected);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.primaryColor : AppColors.white,
          border: Border.all(
            color: widget.isSelected ? AppColors.primaryColor : AppColors.green,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: widget.isSelected
                ? AppTheme.tabs.copyWith(color: AppColors.white)
                : AppTheme.tabs,
          ),
        ),
      ),
    );
  }
}