/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: OTP verification screen.
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/extentions/extension.dart';
import '../../../utils/values/my_color.dart';
import '../../../utils/values/my_fonts.dart';
import '../../../utils/values/style.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  static const Color _pinBg = Color.fromRGBO(244, 246, 250, 1);
  static const Color _pinFocusedBorder = Color.fromRGBO(30, 58, 132, 1);

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: MyFonts.inter,
        color: MyColors.loginTitleDark,
      ),
      decoration: BoxDecoration(
        color: _pinBg,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _pinBg),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: _pinFocusedBorder, width: 1.31),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: MyColors.loginTitleDark, size: 22.r),
          onPressed: () {
            controller.clearOtpFields();
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Verify your account',
                style: kSize14DarkW400Text.copyWith( color: MyColors.loginTitleDark, fontSize: 30, fontWeight: FontWeight.w600) ,
              ),
              7.sbh,
              Text(
                "We've sent a 6-digit code to your mobile number",
                style: kSize16DarkW600Text.copyWith(
                  color: MyColors.loginLegalText,
                  fontWeight: FontWeight.w400,
                )
              ),
              30.sbh,
              Pinput(
                controller: controller.otpController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: focusedPinTheme,
                onChanged: (value) => controller.setOtp(value),
              ),
              30.sbh,
              Obx(
                () => CustomButton(
                  text: 'Verify',
                  onPressed: controller.isOtpValid ? controller.verifyOtp : null,
                  backgroundColor: MyColors.loginPrimary,
                  textColor: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  height: 56.h,
                  width: double.infinity,
                  borderRadius: 16.r,
                ),
              ),
              34.sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: MyFonts.inter,
                      color: MyColors.loginLegalText,
                    ),
                  ),
                  Obx(() {
                    final countdown = controller.resendCooldownSeconds.value;
                    return GestureDetector(
                      onTap: countdown > 0 ? null : controller.resendOtp,
                      child: Text(
                        countdown > 0 ? '$countdown' : 'Resend',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: MyFonts.inter,
                          color: countdown > 0
                              ? MyColors.loginLegalText
                              : MyColors.loginPrimary,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
