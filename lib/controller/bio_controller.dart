/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Bio and interests state for profile flow.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/profile/your_interests_screen.dart';

class BioController extends GetxController {
  SharedPreferences sharedPreferences;
  BioController({
    required this.sharedPreferences,
  });
  final TextEditingController bioController = TextEditingController();
  static const int bioMaxLength = 500;

  int get bioCharCount => bioController.text.length;
  bool get canContinueBio => bioController.text.trim().isNotEmpty;

  void continueToInterests() {
    if (!canContinueBio) return;
    Get.to(() => const YourInterestsScreen());
  }

  // Interests
  final RxList<String> selectedInterests = <String>[].obs;
  static const List<String> allInterests = [
    'Travel', 'Music', 'Movies', 'Fitness', 'Cooking', 'Reading',
    'Gaming', 'Sports', 'Art', 'Photography', 'Dancing', 'Yoga',
    'Hiking', 'Coffee', 'Pets', 'Fashion', 'Technology', 'Food',
    'Wine', 'Nature', 'Meditation', 'Writing', 'Swimming', 'Cycling',
  ];
  static const int minInterestsRequired = 5;

  int get selectedInterestsCount => selectedInterests.length;
  bool get canContinueInterests => selectedInterests.length >= minInterestsRequired;

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  bool isSelected(String interest) => selectedInterests.contains(interest);

  void continueFromInterests() {
    if (!canContinueInterests) return;
    // TODO: submit full profile or navigate to home
    Get.back();
  }

  void clearBio() {
    bioController.clear();
  }

  void clearInterests() {
    selectedInterests.clear();
  }

  @override
  void onClose() {
    bioController.dispose();
    super.onClose();
  }
}
