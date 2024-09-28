import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/gender_box.dart';
import 'package:medical_care/widget/next_steps.dart';
import 'package:medical_care/screens/questions.dart';

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
              DatePickerDropdowns(),
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
              const NextSteps(nextStep: Questions.routeName, nameNextStep: "Save",)
            ],
          ),
        ),
      ),
    );
  }
}

class DatePickerDropdowns extends StatefulWidget {
  @override
  _DatePickerDropdownsState createState() => _DatePickerDropdownsState();
}

class _DatePickerDropdownsState extends State<DatePickerDropdowns> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  List<String> days = List<String>.generate(31, (i) => (i + 1).toString());
  List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  List<String> years =
  List<String>.generate(100, (i) => (DateTime.now().year - i).toString());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date of Birth",
          style: AppTheme.form,
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedDay,
                hint: const Text(
                  "Day",
                  style: AppTheme.formtext,
                ),
                items: days.map((String day) {
                  return DropdownMenuItem<String>(
                    value: day,
                    child: Text(day),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedDay = newValue;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: buildOutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                iconEnabledColor: AppColors.green,
                dropdownColor: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedMonth,
                hint: const Text(
                  "Month",
                  style: AppTheme.formtext,
                ),
                items: months.map((String month) {
                  return DropdownMenuItem<String>(
                    value: month,
                    child: Text(month),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedMonth = newValue;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: buildOutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                iconEnabledColor: AppColors.green,
                dropdownColor: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedYear,
                hint: const Text(
                  "Year",
                  style: AppTheme.formtext,
                ),
                items: years.map((String year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedYear = newValue;
                  });
                },
                decoration: InputDecoration(
                  labelStyle: AppTheme.formtext,
                  enabledBorder: buildOutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                iconEnabledColor: AppColors.green,
                dropdownColor: Colors.white,
              ),
            ),
          ],
        ),
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
