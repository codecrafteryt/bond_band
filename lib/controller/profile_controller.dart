/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Profile form (Tell us about yourself) state and payload.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/profile/add_your_photos_screen.dart';

enum Gender { male, female, other }

enum LookingFor { men, women }

class ProfileController extends GetxController {
  SharedPreferences sharedPreferences;
  ProfileController({
    required this.sharedPreferences,
  });
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final Rx<Gender?> gender = Rx<Gender?>(null);
  final Rx<LookingFor?> lookingFor = Rx<LookingFor?>(null);

  bool get canContinue {
    return firstNameController.text.trim().isNotEmpty &&
        dateOfBirthController.text.trim().isNotEmpty &&
        gender.value != null &&
        lookingFor.value != null;
  }

  Map<String, dynamic> buildPayload() {
    return {
      'first_name': firstNameController.text.trim(),
      'date_of_birth': dateOfBirthController.text.trim(),
      'gender': gender.value?.name,
      'looking_for': lookingFor.value?.name,
    };
  }

  void continueToPhotos() {
    if (!canContinue) return;
    final payload = buildPayload();
    debugPrint('Profile payload: $payload');
    Get.to(() => const AddYourPhotosScreen());
  }

  void clearProfile() {
    firstNameController.clear();
    dateOfBirthController.clear();
    gender.value = null;
    lookingFor.value = null;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }
}
