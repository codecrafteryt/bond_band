/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Your interests screen (select at least 5).
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
import '../widgets/custom_chip.dart';

class YourInterestsScreen extends StatelessWidget {
  const YourInterestsScreen({super.key});

  static const Color _chipUnselectedBg = Color.fromRGBO(244, 246, 250, 1);
  static const Color _chipUnselectedText = Color.fromRGBO(15, 28, 63, 1);
  static const Color _chipSelectedBg = Color.fromRGBO(30, 58, 132, 1);

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
                'Your interests',
                style: kProfileTitleText.copyWith(fontSize: 30.sp),
              ),
              7.sbh,
              Obx(
                () => Text(
                  'Select at least 5 interests (${controller.selectedInterestsCount}/10)',
                  style: kProfileSubtitleText.copyWith(fontSize: 16.sp, color: MyColors.loginLegalText),
                ),
              ),
              30.sbh,
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: BioController.allInterests.map((interest) {
                  return Obx(
                    () {
                      final selected = controller.isSelected(interest);
                      return CustomChip(
                        label: Text(
                          interest,
                          style: TextStyle(
                            fontFamily: MyFonts.inter,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: selected ? Colors.white : _chipUnselectedText,
                          ),
                        ),
                        selected: selected,
                        onSelected: (_) => controller.toggleInterest(interest),
                        selectedColor: _chipSelectedBg,
                        backgroundColor: _chipUnselectedBg,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                        labelStyle: TextStyle(
                          fontFamily: MyFonts.inter,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: selected ? Colors.white : _chipUnselectedText,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              30.sbh,
              Obx(
                () => CustomButton(
                  text: 'Continue',
                  onPressed: controller.canContinueInterests ? controller.continueFromInterests : null,
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
