import 'package:flutter/material.dart';
import 'package:medical_care/utils/aap_theme.dart';

class Counter extends StatelessWidget {
  final int counter;
  final Color color;
  const Counter({super.key,required this.counter, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
          child: Text(
            counter.toString(),
            style: AppTheme.form.copyWith(fontSize: 25,color: color),
          )),
    );
  }
}
