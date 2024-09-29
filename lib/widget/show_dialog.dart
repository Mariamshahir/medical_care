import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class ShowDialog extends StatefulWidget {
  final IconData icon;
  final String title;
  final String text;
  final String? hint;
  final ValueChanged<bool>? onTextEntered;

  const ShowDialog({
    Key? key,
    required this.icon,
    required this.title,
    required this.text,
    this.hint,
    this.onTextEntered,
  }) : super(key: key);

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    widget.onTextEntered?.call(_controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Row(
        children: [
          Icon(
            widget.icon,
            color: AppColors.primaryColor,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              widget.title,
              style: AppTheme.dialog,
              maxLines: 2,
            ),
          ),
        ],
      ),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: widget.text,
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
        if (widget.hint != null)
          Center(
            child: Text(
              widget.hint!,
              style: AppTheme.dialog,
            ),
          ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        InkWell(
          onTap: () {
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
