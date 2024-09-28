import 'package:flutter/material.dart';
import 'package:medical_care/screens/add_drug.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_colors.dart';

class Remamber extends StatelessWidget {
  final String title;
  final String disc;
  final IconData? icon;
  final Color color;
  final Color colorIcon;
  final Color? backgroundColor;
  final String? time;
  final String rem;
  final String? img;
  final String? onTap;

  const Remamber({
    super.key,
    required this.title,
    required this.disc,
    this.icon,
    required this.color,
    this.time,
    required this.rem,
    this.backgroundColor,
    required this.colorIcon,
    this.img,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, onTap!);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: color,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: colorIcon,
                  size: 30,
                ),
              if (img != null)
                Image(
                  image: AssetImage(img!),
                ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: AppTheme.tabs
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        const Spacer(),
                        if (time != null)
                          Text(
                            time!,
                            style: AppTheme.formtext,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            disc,
                            style: AppTheme.formtext,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          rem,
                          style: AppTheme.formtext,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
