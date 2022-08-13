import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen/splash_model.dart';

class ScreenController extends GetxController {
  var selectedPageIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  final PageController controller = PageController();

  var kAnimationDuration = const Duration(milliseconds: 200);
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: currentIndex == index ? 8 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? const Color(0xFFFFFFFF)
            : const Color(0xFFFFFFFF).withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  List<SplashModel> splashScreenList = [
    SplashModel(
      "Onboard One",
      "SKIP",
      "assets/image1.jpg",
      "Hi Am the First Screen hello there one. Share it with your friends.",
    ),
    SplashModel(
      "Onboard Two",
      "SKIP", 
      "assets/image2.jpg",
      "When it comes to design, finding the perfect color combination can be your winning secret to having an eye-catching creation."),
    SplashModel(
      "Onboard Three",
      "SKIP",
      "assets/image3.jpg",
      "It can attract attention, set a mood, and even influence our emotions and perceptions.",
    ),
    SplashModel(
      "Onboard Four",
      "SKIP",
      "assets/image2.jpg",
      "It can attract attention, set a mood, and even influence our emotions and perceptions.",
    ),
  ];
}
