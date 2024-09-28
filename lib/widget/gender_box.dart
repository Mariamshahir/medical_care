import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class GenderBox extends StatefulWidget {
  final String name;
  final IconData icon;
  final Function(bool isSelected) onSelect;
  final bool isSelected;

  const GenderBox({
    Key? key,
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  _GenderBoxState createState() => _GenderBoxState();
}

class _GenderBoxState extends State<GenderBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelect(!widget.isSelected);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.primaryColor : Colors.white,
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
              widget.icon,
              color: AppColors.green,
              size: 30,
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: AppTheme.formtext,
            ),
          ],
        ),
      ),
    );
  }
}