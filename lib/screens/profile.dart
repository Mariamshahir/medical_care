import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:medical_care/screens/splash.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/gender_box.dart';
import 'package:medical_care/widget/save.dart';

class Profile extends StatefulWidget {
  static const String routeName = "profile";

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 48),
          child: Column(
            children: [
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Set up profile",
                      style: AppTheme.title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.cramy,
                          radius: 50,
                          child: Icon(
                            Icons.person_outline,
                            color: AppColors.primaryColor,
                            size: 55,
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 62,
                          child: CircleAvatar(
                            backgroundColor: AppColors.green,
                            radius: 15,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const FormTextItem(
                text: 'Full Name',
                formText: 'Your Name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              const FormTextItem(
                text: 'Phone Number',
                formText: '+25678-9043456',
                icon: Icons.phone_outlined,
              ),
              const SizedBox(height: 16),
              buildDate(),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gender",
                    style: AppTheme.form,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      GenderBox(
                        name: 'Male',
                        icon: Icons.male_outlined,
                        isSelected: selectedGender == 'Male',
                        onSelect: (isSelected) {
                          if (isSelected) {
                            setState(() {
                              selectedGender = 'Male';
                            });
                          }
                        },
                      ),
                      const SizedBox(width: 20),
                      GenderBox(
                        name: 'Female',
                        icon: Icons.female_outlined,
                        isSelected: selectedGender == 'Female',
                        onSelect: (isSelected) {
                          if (isSelected) {
                            setState(() {
                              selectedGender = 'Female';
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Save(
                nextStep: Splash.routeName,
                nameNextStep: "Save",
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date of birth",
          style: AppTheme.form,
        ),
        const SizedBox(height: 6),
        DropdownDatePicker(
          monthFlex: 1,
          dayFlex: 1,
          yearFlex: 1,
          isDropdownHideUnderline: false,
          hintDay: "Date",
          hintMonth: "Month",
          hintYear: "Year",
          hintTextStyle: AppTheme.formtext,
          boxDecoration: BoxDecoration(
            border: Border.all(
              color: AppColors.green,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.green,
          ),
          textStyle: AppTheme.formtext,
          endYear: DateTime.now().year,
        )
      ],
    );
  }
}

class FormTextItem extends StatelessWidget {
  final String text;
  final String formText;
  final IconData icon;

  const FormTextItem({
    Key? key,
    required this.text,
    required this.formText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTheme.form,
        ),
        const SizedBox(
          height: 6,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: formText,
            labelStyle: AppTheme.formtext,
            enabledBorder: buildOutlineInputBorder(),
            prefixIcon: Icon(
              icon,
              color: AppColors.green,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: AppColors.green,
      width: 1.5,
      style: BorderStyle.solid,
    ),
  );
}
