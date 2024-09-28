import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class Pill extends StatelessWidget {
  const Pill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.07,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.white,
          width: 1.5
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text('08 : 00 AM',style: AppTheme.tabs,),
            Spacer(),
            Text('1 pill(s)',style: AppTheme.tabs,),
          ],
        ),
      ),
    );
  }
}
