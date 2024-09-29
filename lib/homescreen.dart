import 'package:flutter/material.dart';
import 'package:medical_care/screens/add_drug.dart';
import 'package:medical_care/screens/profile.dart';
import 'package:medical_care/screens/questions.dart';
import 'package:medical_care/widget/remamber.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homescreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.24,
              decoration: const BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      const Text(
                        "log out",
                        style: AppTheme.formtext,
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Profile.routeName);
                          Navigator.of(context);
                        },
                        icon: const Icon(Icons.logout),
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage(AppAssets.logo),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome mamnullah !",
                              style: AppTheme.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text(
                              "Saturday,21 September 2024",
                              style: AppTheme.formtext,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            buildBox(context)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Reminder", style: AppTheme.name),
                  const SizedBox(
                    height: 15,
                  ),
                  const Remamber(
                    title: "Restock your Metaformin drug",
                    disc: "Diabetes medicine",
                    icon: Icons.notifications_on_outlined,
                    color: AppColors.yellow,
                    rem: '1 cap remainning',
                    colorIcon: AppColors.yellow,
                  ),
                  const SizedBox(height: 23),
                  Row(
                    children: [
                      const Text("Today’s medications", style: AppTheme.name),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text("View all",
                            style: AppTheme.name.copyWith(fontSize: 15)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Remamber(
                    onTap: AddDrug.routeName,
                    title: "Metaformin",
                    disc: "Diabetes drug ",
                    icon: Icons.clean_hands_outlined,
                    color: AppColors.green,
                    rem: "1 cap",
                    time: "8 AM",
                    colorIcon: AppColors.green,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Remamber(
                    onTap: AddDrug.routeName,
                    title: "panadol extra",
                    disc: "Influenza drug ",
                    icon: Icons.clean_hands_outlined,
                    color: AppColors.green,
                    rem: "1 cap after breakast",
                    time: "10 AM",
                    colorIcon: AppColors.green,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Remamber(
                    onTap: AddDrug.routeName,
                    title: "concor 5 plus",
                    disc: "High pressure drug",
                    icon: Icons.clean_hands_outlined,
                    color: AppColors.green,
                    rem: "1 cap before lunch",
                    time: "12 PM",
                    colorIcon: AppColors.green,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBox(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Questions.routeName);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(
            color: AppColors.primaryColor,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "Add new drug",
            style: AppTheme.formtext.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
