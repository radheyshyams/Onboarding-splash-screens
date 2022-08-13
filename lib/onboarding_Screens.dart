import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen/homepage.dart';
import 'package:onboarding_screen/screen_controller.dart';
import 'package:onboarding_screen/widget_onboard.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final ScreenController screenController = Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    List<Color> colors = [
      Color.fromARGB(255, 248, 109, 185),
      Color(0xffFE6F9B)
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors,
          ),
        ),
        child: Obx(
          () => Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    screenController.currentIndex.value = value;
                  });
                },
                controller: screenController.controller,
                itemCount: screenController.splashScreenList.length,
                itemBuilder: (context, index) {
                  return PageBuilderWidget(
                    title: screenController.splashScreenList[index].title,
                    skip: screenController.splashScreenList[index].skip,
                    imgMobile:
                        screenController.splashScreenList[index].imgMobile,
                    description:
                        screenController.splashScreenList[index].description,
                  );
                },
              ),
              Positioned(
                bottom: 50.0,
                left: Get.width * 0.5 - 40.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        screenController.splashScreenList.length,
                        (index) => screenController.buildDot(index: index),
                      ),
                    ),
                    const SizedBox(
                      height: 43.0,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 80.0,
                      onPressed: () {
                        if (screenController.currentIndex < 3) {
                          screenController.currentIndex =
                              screenController.currentIndex + 1;
                          //controller.jumpToPage(currentPage.value);
                          screenController.controller.animateToPage(
                              screenController.currentIndex.value,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                        } else {
                          Get.to(() => const HomePage());
                        }
                      },
                      icon: Obx(
                        () =>
                            Image.asset(screenController.currentIndex.value == 0
                                ? "assets/skip1.png"
                                : screenController.currentIndex.value == 1
                                    ? "assets/skip2.png"
                                    : screenController.currentIndex.value == 2
                                        ? "assets/skip3.png"
                                        : "assets/skip4.png"),
                      ),
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
