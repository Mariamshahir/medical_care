import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class ShowDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final String? hint;
  final VoidCallback? onDone;

  const ShowDialog({
    Key? key,
    required this.icon,
    required this.title,
    required this.text,
    this.hint,
    this.onDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
              style: AppTheme.dialog,
              maxLines: 2,
            ),
          ),
        ],
      ),
      content: TextField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: AppTheme.dialog,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.green,
              width: 1.5,
            ),
          ),
        ),
      ),
      actions: [
        if (hint != null)
          Center(
            child: Text(
              hint!,
              style: AppTheme.dialog,
            ),
          ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        InkWell(
          onTap: () {
            onDone?.call();
            Navigator.of(context).pop();
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                'Done',
                style: AppTheme.dialog.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
