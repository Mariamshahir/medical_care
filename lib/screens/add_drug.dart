import 'package:flutter/material.dart';
import 'package:medical_care/screens/edit_add.dart';
import 'package:medical_care/screens/questions.dart';
import 'package:medical_care/widget/remamber.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/next_steps.dart';

class AddDrug extends StatelessWidget {
  static const String routeName = "adddrug";

  const AddDrug({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(AppAssets.medical),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "All your medications",
                          style: AppTheme.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, EditAdd.routeName);
                      },
                      child: const Remamber(
                        onTap: AddDrug.routeName,
                        title: "Metaformin",
                        disc: "Diabetes drug",
                        icon: Icons.clean_hands_outlined,
                        color: AppColors.green,
                        rem: "1 cap",
                        time: "8 AM",
                        colorIcon: AppColors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            const NextSteps(
                nextStep: Questions.routeName, nameNextStep: "Add new drug")
          ],
        ),
      ),
    );
  }
}
