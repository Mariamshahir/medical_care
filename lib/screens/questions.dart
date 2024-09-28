import 'package:flutter/material.dart';
import 'package:medical_care/screens/conferm.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/choose_disease.dart';
import 'package:medical_care/widget/counter.dart';
import 'package:medical_care/widget/next_steps.dart';
import 'package:medical_care/widget/previous_steps.dart';
import 'package:medical_care/widget/title_tabs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class Questions extends StatefulWidget {
  static const String routeName = "questions";

  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> with SingleTickerProviderStateMixin {
  String? selectedDisease;
  final TextEditingController _controller = TextEditingController();
  late PageController _pageController;
  late PageController _titleController;
  late PageController _counterController;
  int _selectedCounter = 0;
  int _currentIndex = 0; // Track the current index of the content
  DateTime _selectedTime = DateTime.now();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _counterController = PageController(viewportFraction: 0.2);
    _pageController = PageController(viewportFraction: 1.0);
    _titleController = PageController(viewportFraction: 1.0);
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void nextTab() {
    if (_currentIndex < 3) {
      _currentIndex++;
      _titleController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      _pageController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void backTab() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _titleController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      _pageController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
      ),
      backgroundColor: AppColors.green,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: PageView(
              controller: _titleController,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: const [
                TitleTabs(image: AppAssets.icon, nameTitle: "Name of disease ?"),
                TitleTabs(image: AppAssets.drug, nameTitle: "Name of drug ?"),
                TitleTabs(image: AppAssets.timeCapsule, nameTitle: "How many times a day ?"),
                TitleTabs(image: AppAssets.time, nameTitle: "When will be the first time you take the treatment ?"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SmoothPageIndicator(
                controller: _titleController,
                count: 4,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 4.0,
                  radius: 0,
                  dotColor: AppColors.white,
                  dotWidth: 9.0,
                  expansionFactor: 4,
                  paintStyle: PaintingStyle.fill,
                  offset: 9,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            ),
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                buildDisease(context),
                buildDrug(context),
                buildTimeDay(context),
                buildTimes(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          TimePickerSpinner(
            alignment: Alignment.center,
            is24HourMode: false,
            normalTextStyle: AppTheme.form.copyWith(fontSize: 25, color: AppColors.green),
            highlightedTextStyle: AppTheme.form.copyWith(fontSize: 25, color: AppColors.primaryColor),
            spacing: 40,
            itemHeight: 50,
            isForce2Digits: true,
            onTimeChange: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.3,),
          const NextSteps(
            nextStep: Conferm.routeName,
            nameNextStep: "Next",
            icon: Icons.play_arrow_rounded,
          ),
          const SizedBox(height: 16),
          PreviousSteps(
            namePreviousStep: "Previous",
            icon: Icons.arrow_left_outlined,
            onTap: backTab,
          ),
        ],
      ),
    );
  }

  Widget buildTimeDay(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  child: PageView.builder(
                    controller: _counterController,
                    onPageChanged: (int page) {
                      setState(() {
                        _selectedCounter = page;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return Counter(
                        counter: index,
                        color: _selectedCounter == index ? AppColors.primaryColor : AppColors.green,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "times a day",
                style: AppTheme.counter,
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
        NextSteps(
          nameNextStep: "Next",
          icon: Icons.play_arrow_rounded,
          onTap: nextTab,
        ),
        const SizedBox(height: 16),
        PreviousSteps(
          namePreviousStep: "Previous",
          icon: Icons.arrow_left_outlined,
          onTap: backTab,
        ),
      ],
    );
  }

  Widget buildDrug(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Write your drug",
              labelStyle: AppTheme.formtext,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: AppColors.green,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _controller.clear();
                },
                icon: const Icon(
                  Icons.clear,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
        NextSteps(
          nameNextStep: "Next",
          icon: Icons.play_arrow_rounded,
          onTap: nextTab,
        ),
        const SizedBox(height: 16),
        PreviousSteps(
          namePreviousStep: "Previous",
          icon: Icons.arrow_left_outlined,
          onTap: backTab,
        ),
      ],
    );
  }

  Widget buildDisease(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Column(
            children: [
              ChooseDisease(
                name: 'Diabetes',
                isSelected: selectedDisease == 'Diabetes',
                onSelect: (bool isSelected) {
                  if (isSelected) {
                    setState(() {
                      selectedDisease = 'Diabetes';
                    });
                  }
                },
              ),
              const SizedBox(height: 22),
              ChooseDisease(
                name: 'High Blood Pressure',
                isSelected: selectedDisease == 'High Blood Pressure',
                onSelect: (bool isSelected) {
                  if (isSelected) {
                    setState(() {
                      selectedDisease = 'High Blood Pressure';
                    });
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              NextSteps(
                nameNextStep: "Next",
                icon: Icons.play_arrow_rounded,
                onTap: nextTab,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
