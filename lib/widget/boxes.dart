import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class Boxes extends StatefulWidget {
  final String name;
  final IconData icon;

  const Boxes({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  _BoxesState createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: AppColors.primaryColor,
                size: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  widget.name,
                  style: AppTheme.tabs.copyWith(color: AppColors.primaryColor),
                ),
              ),
              if (_isSelected)
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
