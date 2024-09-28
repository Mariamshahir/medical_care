import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';

class TitleTabs extends StatelessWidget {
  final String image;
  final String nameTitle;
  const TitleTabs({super.key, required this.image, required this.nameTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(image: AssetImage(image)),
        const SizedBox(width: 7),
        Expanded( // Use Expanded to allow text to take remaining space
          child: Text(
            nameTitle,
            style: AppTheme.titleTabs,
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
          ),
        ),
      ],
    );
  }
}
