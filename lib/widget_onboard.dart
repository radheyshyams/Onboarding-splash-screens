import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen/homepage.dart';

class PageBuilderWidget extends StatelessWidget {
  String title;
  String skip;
  String imgMobile;
  String description;

  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.skip,
      required this.imgMobile,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18.0, 52.0, 18.0, 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const HomePage());
                },
                child: Text(
                  skip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 45.5,
          ),
          Image.asset(
            imgMobile,
            width: Get.width * 0.7,
            height: Get.height * 0.45,
          ),
          const SizedBox(
            height: 37.28,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0),
            child: Text(
              description,
              style: const TextStyle(color: Colors.white, fontSize: 22.0),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 106.0,
          ),
        ],
      ),
    );
  }
}
