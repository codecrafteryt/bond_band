/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 03, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Splash Screen UI and some logic.
*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/values/my_color.dart';
import '../../utils/values/my_images.dart';
import '../../utils/values/style.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            MyImages.splashBg,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  MyImages.splashIcon,
                  width: 250.w,
                  height: 250.h,
                ),
                Transform.translate(
                  offset: Offset(0, -50),
                  child: Text(
                    'Bond Band',
                    style: kSplashTitleText,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -45),
                  child: Text(
                    'FIND YOUR CONNECTION',
                    style: kSplashSubtitleText,
                  ),
                ),

                Transform.translate(
                  offset: Offset(0, -20),
                  child: SpinKitThreeInOut(
                    color: MyColors.white,
                    size: 30.r,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
