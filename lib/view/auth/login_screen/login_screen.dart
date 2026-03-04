/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Login / Signup screen (Mobile or Email).
*/

import 'package:bond_band/utils/extentions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/values/my_color.dart';
import '../../../utils/values/my_fonts.dart';
import '../../../utils/values/my_images.dart';
import '../../../utils/values/style.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color _fieldBg = Color.fromRGBO(244, 246, 250, 1);
  static const Color _tabBorder = Color.fromRGBO(30, 58, 132, 1);
  static const double _tabBorderWidth = 1.31;

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: -50,
            child: Opacity(
              opacity: 0.75,
              child: Image.asset(
                MyImages.lightIcon,
                width: 240.w,
                height: 180.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  150.sbh,
                  Center(
                    child: Image.asset(
                      MyImages.loginLogo,
                      width: 356.w,
                      height: 212.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                 50.sbh,
                  _buildMobileEmailTabs(controller),
                  24.sbh,
                  Obx(() => controller.isMobileTab.value ? _buildPhoneField(controller) : _buildEmailField(controller)),
                 30.sbh,
                  Obx(() => CustomButton(
                      text: 'Continue',
                      onPressed: controller.canContinue ? controller.continueToOtp : null,
                      backgroundColor: MyColors.loginPrimary,
                      textColor: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 56.h,
                      width: double.infinity,
                      borderRadius: 16.r,
                    ),
                  ),
                  40.sbh,
                  Text(
                    'By continuing, you agree to our Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: kSize14DarkW400Text.copyWith(color: MyColors.loginLegalText,) ,
                  ),
                  10.sbh,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileEmailTabs(AuthController controller) {
    return Row(
      children: [
        Expanded(
          child: Obx(() {
            final isMobile = controller.isMobileTab.value;
            return GestureDetector(
              onTap: () => controller.setLoginTab(true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: isMobile ? MyColors.loginPrimaryLight : _fieldBg,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isMobile ? _tabBorder : Colors.transparent,
                    width: _tabBorderWidth,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_android_outlined,
                      size: 20.r,
                      color: MyColors.loginTabInactive,
                    ),
                    5.sbw,
                    Text(
                      'Mobile',
                      style: kSize16DarkW600Text.copyWith(
                        color: MyColors.loginTabInactive,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Obx(() {
            final isEmail = !controller.isMobileTab.value;
            return GestureDetector(
              onTap: () => controller.setLoginTab(false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: isEmail ? MyColors.loginPrimaryLight : _fieldBg,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isEmail ? _tabBorder : Colors.transparent,
                    width: _tabBorderWidth,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 20.r,
                      color: MyColors.loginTabInactive,
                    ),
                    5.sbw,
                    Text(
                      'Email',
                      style: kSize16DarkW600Text.copyWith(
                        color: MyColors.loginTabInactive,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPhoneField(AuthController controller) {
    return IntlPhoneField(
      disableLengthCheck: true,
      dropdownIcon: Icon(Icons.keyboard_arrow_down_outlined),
      controller: controller.phoneController,
      decoration: InputDecoration(
        filled: true,
        fillColor: _fieldBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        hintText: 'Enter mobile number',
        hintStyle: TextStyle(
          color: MyColors.textFieldHintText,
          fontSize: 14,
          fontFamily: MyFonts.inter,
        ),
      ),
      style: TextStyle(
        fontSize: 14,
        fontFamily: MyFonts.inter,
        color: MyColors.loginTitleDark,
      ),
      onChanged: (phone) {
        controller.onPhoneChanged(phone.completeNumber);
      },
    );
  }

  Widget _buildEmailField(AuthController controller) {
    return TextFormField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (v) {
        controller.emailText.value = v;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: _fieldBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        hintText: 'Enter your email',
        hintStyle: TextStyle(
          color: MyColors.textFieldHintText,
          fontSize: 14,
          fontFamily: MyFonts.inter,
        ),
      ),
      style: TextStyle(
        fontSize: 14,
        fontFamily: MyFonts.inter,
        color: MyColors.loginTitleDark,
      ),
    );
  }
}
