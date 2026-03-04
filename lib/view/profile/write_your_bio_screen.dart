/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Write your bio screen.
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/bio_controller.dart';
import '../../utils/extentions/extension.dart';
import '../../utils/values/my_color.dart';
import '../../utils/values/my_fonts.dart';
import '../../utils/values/style.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';

class WriteYourBioScreen extends StatelessWidget {
  const WriteYourBioScreen({super.key});

  static const Color _fieldBg = Color.fromRGBO(244, 246, 250, 1);
  static const Color _hintColor = Color.fromRGBO(15, 28, 63, 0.5);

  @override
  Widget build(BuildContext context) {
    final BioController controller = Get.find<BioController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: MyColors.loginTitleDark, size: 22.r),
          onPressed: () => Get.back(),
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
                'Write your bio',
                style: kProfileTitleText.copyWith(fontSize: 30.sp),
              ),
              7.sbh,
              Text(
                'Tell others about yourself',
                style: kProfileSubtitleText.copyWith(fontSize: 16.sp, color: MyColors.loginLegalText),
              ),
              30.sbh,
              SizedBox(
                width: 363.w,
                height: 227.h,
                child: TextFormField(
                  controller: controller.bioController,
                  maxLength: BioController.bioMaxLength,
                  maxLines: null,
                  expands: true,
                  onChanged: (_) => controller.update(),
                  decoration: InputDecoration(
                    counterText: '',
                    filled: true,
                    fillColor: _fieldBg,
                    hintText: 'A little about me...',
                    hintStyle: TextStyle(
                      fontFamily: MyFonts.inter,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: _hintColor,
                    ),
                    contentPadding: EdgeInsets.all(16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: _fieldBg),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: _fieldBg),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: MyFonts.inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: MyColors.loginTitleDark,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              GetBuilder<BioController>(
                builder: (_) => Text(
                  '${controller.bioCharCount}/${BioController.bioMaxLength}',
                  style: TextStyle(
                    fontFamily: MyFonts.inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: MyColors.loginLegalText,
                  ),
                ),
              ),
              65.sbh,
              Container(
                width: 363.w,
                height: 128.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: _fieldBg,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suggestions:',
                      style: TextStyle(
                        fontFamily: MyFonts.inter,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: MyColors.loginTitleDark,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Share your hobbies and interests',
                      style: TextStyle(
                        fontFamily: MyFonts.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: MyColors.loginLegalText,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'What makes you unique',
                      style: TextStyle(
                        fontFamily: MyFonts.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: MyColors.loginLegalText,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "What you're looking for",
                      style: TextStyle(
                        fontFamily: MyFonts.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: MyColors.loginLegalText,
                      ),
                    ),
                  ],
                ),
              ),
              30.sbh,
              GetBuilder<BioController>(
                builder: (_) => CustomButton(
                  text: 'Continue',
                  onPressed: controller.canContinueBio ? controller.continueToInterests : null,
                  backgroundColor: MyColors.loginPrimary,
                  textColor: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  height: 56.h,
                  width: double.infinity,
                  borderRadius: 16.r,
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
