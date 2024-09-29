import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class PopupDialog extends StatefulWidget {
  const PopupDialog({super.key});

  @override
  State<PopupDialog> createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  bool isSelectedSkip = false;
  bool isSelectedTake = false;
  bool isSelectedReschedule = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: AppColors.white,
      contentPadding: const EdgeInsets.all(16),
      icon: const Row(
        children: [
          Icon(Icons.info_outline),
          Spacer(),
          Icon(Icons.delete_outline_rounded),
          SizedBox(width: 10),
          Icon(Icons.edit_outlined),
        ],
      ),
      iconColor: AppColors.primaryColor,
      title: Center(
        child: Text(
          "Metaformin",
          style: AppTheme.dialog.copyWith(fontSize: 20),
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.calendar_month, color: AppColors.primaryColor),
                Text(
                  "Scheduled for 4:30 AM, today",
                  style: AppTheme.formtext,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.restore_page_outlined,
                    color: AppColors.primaryColor),
                Text(
                  "325-5 mg, take 1 Pill(s) before eating",
                  style: AppTheme.formtext,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.local_drink_outlined, color: AppColors.primaryColor),
                Text("2 pill(s) left", style: AppTheme.formtext),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelectedSkip = !isSelectedSkip;
                    });
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: isSelectedSkip
                            ? AppColors.primaryColor
                            : AppColors.white,
                        child: Icon(Icons.close,
                            color: isSelectedSkip
                                ? AppColors.white
                                : AppColors.primaryColor),
                      ),
                      const Text("SKIP"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelectedTake = !isSelectedTake;
                    });
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: isSelectedTake
                            ? AppColors.primaryColor
                            : AppColors.white,
                        child: Icon(Icons.check,
                            color: isSelectedTake
                                ? AppColors.white
                                : AppColors.primaryColor),
                      ),
                      const Text("TAKE"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelectedReschedule = !isSelectedReschedule;
                    });
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: isSelectedReschedule
                            ? AppColors.primaryColor
                            : AppColors.white,
                        child: Icon(Icons.timer_sharp,
                            color: isSelectedReschedule
                                ? AppColors.white
                                : AppColors.primaryColor),
                      ),
                      const Text("RESCHEDULE"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
