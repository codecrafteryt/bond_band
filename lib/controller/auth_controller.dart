/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 4, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Auth Logic (login, OTP, validation).
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repo/auth_repo/auth_repo.dart';
import '../view/auth/otp_screen/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  AuthController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  // Login / Signup
  final RxBool isMobileTab = true.obs;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final RxString fullPhoneNumber = ''.obs; // set from IntlPhoneField.onChanged
  final RxString emailText = ''.obs; // for reactive validation

  bool get isPhoneValid {
    final digits = fullPhoneNumber.value.replaceAll(RegExp(r'\D'), '');
    return digits.length >= 10;
  }

  bool get isEmailValid {
    final email = emailText.value.trim();
    return email.isNotEmpty && GetUtils.isEmail(email);
  }

  bool get canContinue {
    if (isMobileTab.value) {
      return isPhoneValid;
    }
    return isEmailValid;
  }

  void setLoginTab(bool isMobile) {
    isMobileTab.value = isMobile;
  }

  void onPhoneChanged(String? completeNumber) {
    fullPhoneNumber.value = completeNumber ?? '';
  }

  void continueToOtp() {
    if (!canContinue) return;
    Get.to(() => const OtpScreen());
  }

  void clearLoginFields() {
    phoneController.clear();
    emailController.clear();
    emailText.value = '';
    fullPhoneNumber.value = '';
  }

  // OTP screen
  final TextEditingController otpController = TextEditingController();
  final RxString otpText = ''.obs;
  final RxInt resendCooldownSeconds = 0.obs;
  static const int resendCooldownTotal = 15;

  bool get isOtpValid {
    return otpText.value.length == 6;
  }

  void setOtp(String value) {
    otpText.value = value;
  }

  void startResendCooldown() {
    if (resendCooldownSeconds.value > 0) return;
    resendCooldownSeconds.value = resendCooldownTotal;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      resendCooldownSeconds.value = resendCooldownSeconds.value - 1;
      return resendCooldownSeconds.value > 0;
    });
  }

  void resendOtp() {
    if (resendCooldownSeconds.value > 0) return;
    startResendCooldown();
    // TODO: call API to resend OTP
  }

  void verifyOtp() {
    if (!isOtpValid) return;
    // TODO: call API to verify OTP, then navigate to home
    Get.back();
  }

  void clearOtpFields() {
    otpController.clear();
    otpText.value = '';
  }

  @override
  void onClose() {
    phoneController.dispose();
    emailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
