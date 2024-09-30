import 'package:flutter/material.dart';
import 'package:medical_care/homescreen.dart';
import 'package:medical_care/utils/aap_theme.dart';
import 'package:medical_care/utils/app_assets.dart';
import 'package:medical_care/utils/app_colors.dart';
import 'package:medical_care/widget/boxes.dart';
import 'package:medical_care/widget/choose_disease.dart';
import 'package:medical_care/widget/counter.dart';
import 'package:medical_care/widget/next_steps.dart';
import 'package:medical_care/widget/previous_steps.dart';
import 'package:medical_care/widget/remamber.dart';
import 'package:medical_care/widget/save.dart';
import 'package:medical_care/widget/show_dialog.dart';
import 'package:medical_care/widget/title_tabs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class Questions extends StatefulWidget {
  static const String routeName = "questions";

  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions>
    with SingleTickerProviderStateMixin {
  String? selectedDisease;
  final TextEditingController _controller = TextEditingController();
  late PageController _pageController;
  late PageController _titleController;
  late PageController _counterController;
  int _selectedCounter = 0;
  int _currentIndex = 0;
  DateTime _selectedTime = DateTime.now();
  late TabController _tabController;
  bool _isTextEnteredDuration = false;
  bool _isTextEnteredReminder = false;
  bool _isTextEnteredInstructions = false;

  void _onTextEnteredDuration(bool isEntered) {
    setState(() {
      _isTextEnteredDuration = isEntered;
    });
  }

  void _onTextEnteredReminder(bool isEntered) {
    setState(() {
      _isTextEnteredReminder = isEntered;
    });
  }

  void _onTextEnteredInstructions(bool isEntered) {
    setState(() {
      _isTextEnteredInstructions = isEntered;
    });
  }

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
    if (_currentIndex < 4) {
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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PageView(
                controller: _titleController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: const [
                  TitleTabs(
                      image: AppAssets.icon, nameTitle: "Name of disease ?"),
                  TitleTabs(image: AppAssets.drug, nameTitle: "Name of drug ?"),
                  TitleTabs(
                      image: AppAssets.timeCapsule,
                      nameTitle: "How many times a day ?"),
                  TitleTabs(
                      image: AppAssets.time,
                      nameTitle:
                          "When will be the first time you take the treatment ?"),
                  Remamber(
                    title: "Metaformin",
                    disc: "Diabetes drug ",
                    icon: Icons.medical_services,
                    color: AppColors.green,
                    rem: '1 cap',
                    time: "8 AM",
                    colorIcon: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SmoothPageIndicator(
                controller: _titleController,
                count: 5,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 4.0,
                  radius: 0,
                  dotColor: AppColors.white,
                  dotWidth: 9.0,
                  expansionFactor: 5,
                  paintStyle: PaintingStyle.fill,
                  offset: 9,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
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
                  buildConferm(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConferm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Almost done. Would you like to:",
            style: AppTheme.formtext,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Boxes(
                    name: 'Duration definder',
                    icon: Icons.calendar_month_rounded,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ShowDialog(
                            icon: Icons.timer_sharp,
                            title:
                            'How many hours will there be between each tablet and the next?',
                            text: 'Hours',
                            hint: 'Hours',
                            onTextEntered: _onTextEnteredDuration,
                          );
                        },
                      );
                    },
                    isTextEntered: _isTextEnteredDuration,
                  ),
                  const SizedBox(height: 20),
                  Boxes(
                    name: 'Get refill reminder ?',
                    icon: Icons.notifications_active_outlined,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ShowDialog(
                            icon: Icons.notifications_active_outlined,
                            title:
                            'When should we remind you to refill your prescription ?',
                            text: 'Bills left',
                            hint: 'Bills left',
                            onTextEntered: _onTextEnteredReminder,
                          );
                        },
                      );
                    },
                    isTextEntered: _isTextEnteredReminder,
                  ),
                  const SizedBox(height: 20),
                  Boxes(
                    name: 'Add instructions ?',
                    icon: Icons.calendar_month_rounded,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ShowDialog(
                            icon: Icons.add_circle_outline_rounded,
                            title: 'Add instructions?',
                            text: 'Write your instructions',
                            onTextEntered: _onTextEnteredInstructions,
                          );
                        },
                      );
                    },
                    isTextEntered: _isTextEnteredInstructions,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Save(
            nameNextStep: "Save",
            onTap: () {
              _showDialog(context);
            },
          ),
          const SizedBox(height: 16),
          PreviousSteps(
            previousStep: Questions.routeName,
            namePreviousStep: "Previous",
            icon: Icons.arrow_left_outlined,
            onTap: backTab,
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
            normalTextStyle:
                AppTheme.form.copyWith(fontSize: 25, color: AppColors.green),
            highlightedTextStyle: AppTheme.form
                .copyWith(fontSize: 25, color: AppColors.primaryColor),
            spacing: 40,
            itemHeight: 50,
            isForce2Digits: true,
            onTimeChange: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),
          const Spacer(),
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
                        color: _selectedCounter == index
                            ? AppColors.primaryColor
                            : AppColors.green,
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
        const Spacer(),
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
        const Spacer(),
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
        const Spacer(flex: 5),
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
        const Spacer(),
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

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            actions: [
              const Center(
                child: Image(
                  image: AssetImage(AppAssets.save),
                  alignment: Alignment.center,
                ),
              ),
              const Center(
                  child: Text(
                "Your drug added succefully",
                style: AppTheme.titleTabs,
                maxLines: 2,
              )),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Ok',
                      style: AppTheme.dialog.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
