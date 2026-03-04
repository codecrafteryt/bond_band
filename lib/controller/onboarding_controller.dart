/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Onboarding logic (no repo).
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/auth/login_screen/login_screen.dart';

class OnboardingController extends GetxController {
  SharedPreferences sharedPreferences;
  OnboardingController({
    required this.sharedPreferences,
  });
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  static const int totalPages = 4;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onComplete();
    }
  }

  void skip() {
    _onComplete();
  }

  void _onComplete() {
    Get.offAll(() => const LoginScreen());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
