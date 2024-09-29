import 'package:flutter/material.dart';
import 'package:medical_care/homescreen.dart';
import 'package:medical_care/screens/add_drug.dart';
import 'package:medical_care/screens/conferm.dart';
import 'package:medical_care/screens/edit_add.dart';
import 'package:medical_care/screens/profile.dart';
import 'package:medical_care/screens/questions.dart';
import 'package:medical_care/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        Profile.routeName: (_) => const Profile(),
        Conferm.routeName: (context) => const Conferm(),
        AddDrug.routeName: (context) => const AddDrug(),
        EditAdd.routeName: (context) => const EditAdd(),
        Questions.routeName: (context) => const Questions(),
        Splash.routeName:(context)=> const Splash()
      },
      initialRoute: Profile.routeName,
    );
  }
}
