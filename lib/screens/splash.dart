import 'package:flutter/material.dart';
import 'package:medical_care/screens/questions.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/save.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome aboard , mamnullah !",
              style: AppTheme.title.copyWith(fontSize: 24),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Image(image: AssetImage(AppAssets.splash)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              "you’ve completed your profile . now let’s add your medication to create your first reminder",
              style: AppTheme.title.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Save(
              nameNextStep: "Add my drug",
              nextStep: Questions.routeName,
            )
          ],
        ),
      ),
    );
  }
}
