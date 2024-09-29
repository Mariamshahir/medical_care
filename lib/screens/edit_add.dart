import 'package:flutter/material.dart';
import 'package:medical_care/widget/remamber.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/pill.dart';
import 'package:medical_care/widget/popup_dialog.dart';

class EditAdd extends StatelessWidget {
  static const String routeName = "editadd";

  const EditAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.primaryColor, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          )
        ],
      ),
      backgroundColor: AppColors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Remamber(
              title: "Metaformin",
              disc: "Diabetes drug",
              time: "8 AM",
              backgroundColor: AppColors.green,
              img: AppAssets.drug,
              color: AppColors.green,
              rem: "1 cap",
              colorIcon: AppColors.primaryColor,
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: AppColors.cramy,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50), bottom: Radius.zero),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const PopupDialog();
                                  });
                            },
                            child: const Pill()),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
