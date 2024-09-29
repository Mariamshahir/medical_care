import 'package:flutter/material.dart';
import 'package:medical_care/homescreen.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/boxes.dart';
import 'package:medical_care/widget/next_steps.dart';
import 'package:medical_care/widget/previous_steps.dart';
import 'package:medical_care/screens/questions.dart';
import 'package:medical_care/widget/show_dialog.dart';

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

  void _onDone() {
    setState(() {});
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
                  top: Radius.circular(50),
                  bottom: Radius.zero,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Almost done. Would you like to:",
                          style: AppTheme.formtext,
                        ),
                        const SizedBox(height: 20),
                        Boxes(
                          name: 'Duration definder',
                          icon: Icons.calendar_month_rounded,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ShowDialog(
                                  icon: Icons.timer_sharp,
                                  title:
                                      'How many hours will there be between each tablet and the next?',
                                  text: 'Hours',
                                  hint: 'Hours',
                                  onDone: _onDone,
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 22),
                        Boxes(
                          name: 'Get refill reminder?',
                          icon: Icons.notifications_active_outlined,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ShowDialog(
                                  icon: Icons.notifications_active_outlined,
                                  title:
                                      'When should we remind you to refill your prescription?',
                                  text: 'Bills left',
                                  hint: "Bills Left",
                                  onDone: _onDone,
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 22),
                        Boxes(
                          name: 'Add instructions?',
                          icon: Icons.add_circle_outline_rounded,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ShowDialog(
                                  icon: Icons.add_circle_outline_rounded,
                                  title: 'Add instructions?',
                                  text: 'Write your instructions',
                                  onDone: _onDone,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  NextSteps(
                    nameNextStep: "Save",
                    onTap: () {
                      _showDialog(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  PreviousSteps(
                    previousStep: Questions.routeName,
                    namePreviousStep: "Previous",
                    icon: Icons.arrow_left_outlined,
                    onTap: goBack,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            actions: [
              const Image(
                image: AssetImage(AppAssets.save),
                alignment: Alignment.center,
              ),
              const Center(
                  child: Text(
                "your drug added succefully",
                style: AppTheme.titleTabs,
                maxLines: 2,
              )),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
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
                      'Ok',
                      style: AppTheme.dialog.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
