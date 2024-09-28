import 'package:flutter/material.dart';
import 'package:medical_care/homescreen.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/boxes.dart';
import 'package:medical_care/widget/next_steps.dart';
import 'package:medical_care/widget/previous_steps.dart';
import 'package:medical_care/screens/questions.dart';

class Conferm extends StatefulWidget {
  static const String routeName = "conferm";

  const Conferm({super.key});

  @override
  State<Conferm> createState() => _ConfermState();
}

class _ConfermState extends State<Conferm> {
  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
      ),
      backgroundColor: AppColors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(image: AssetImage(AppAssets.drug)),
                            SizedBox(
                              width: 7,
                            ),
                            Text("Metaformin", style: AppTheme.titleTabs),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child:
                              Text("Diabetes drug", style: AppTheme.formtext),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("8 AM", style: AppTheme.formtext),
                      Text("1 cap", style: AppTheme.formtext),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                  color: AppColors.cramy,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50), bottom: Radius.zero)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Almost done . would you like to :",
                          style: AppTheme.formtext,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Boxes(
                          name: 'Duration definder',
                          icon: Icons.calendar_month_rounded,
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Boxes(
                          name: 'Get refill reminder ?',
                          icon: Icons.notifications_active_outlined,
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Boxes(
                            name: 'Add instructions ?',
                            icon: Icons.add_circle_outline_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  const NextSteps(
                    nextStep: HomeScreen.routeName,
                    nameNextStep: "Save",
                  ),
                  const SizedBox(height: 16),
                  PreviousSteps(
                    previousStep: Questions.routeName,
                    namePreviousStep: "Previous",
                    icon: Icons.arrow_left_outlined,
                    onTap: goBack,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
