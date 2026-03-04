/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Tell us about yourself (profile form).
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/profile_controller.dart';
import '../../../utils/extentions/extension.dart';
import '../../../utils/values/my_color.dart';
import '../../../utils/values/style.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_textfield.dart';
import 'add_your_photos_screen.dart';

class TellUsAboutYourselfScreen extends StatelessWidget {
  const TellUsAboutYourselfScreen({super.key});

  static const Color _fieldBg = Color.fromRGBO(244, 246, 250, 1);
  static const Color _chipUnselectedBg = Color.fromRGBO(244, 246, 250, 1);
  static const Color _chipUnselectedText = Color.fromRGBO(15, 28, 63, 1);
  static const Color _chipSelectedBg = Color.fromRGBO(30, 58, 132, 1);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
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
              Text('Tell us about yourself', style: kProfileTitleText.copyWith(fontSize: 30.sp)),
              7.sbh,
              Text(
                "Let's get to know you better",
                style: kProfileSubtitleText.copyWith(fontSize: 16.sp, color: MyColors.loginLegalText),
              ),
              30.sbh,
              Text('First Name', style: kProfileLabelText.copyWith(fontSize: 16.sp)),
              8.sbh,
              CustomTextField(
                hintText: 'Enter your first name',
                controller: controller.firstNameController,
                fillColor: _fieldBg,
                borderColor: _fieldBg,
                focusedBorderColor: _fieldBg,
                hintColor: MyColors.loginLegalText,
                textColor: MyColors.loginTitleDark,
                cursorColor: MyColors.loginTitleDark,
                fontSize: 14.sp,
                height: 56.h,
                width: double.infinity,
                borderRadius: 12.r,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                onChanged: (_) => controller.update(),
              ),
              14.sbh,
              Text('Date of Birth', style: kProfileLabelText.copyWith(fontSize: 16.sp)),
              8.sbh,
              CustomTextField(
                hintText: 'Select date',
                controller: controller.dateOfBirthController,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    controller.dateOfBirthController.text =
                        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
                    controller.update();
                  }
                },
                fillColor: _fieldBg,
                borderColor: _fieldBg,
                focusedBorderColor: _fieldBg,
                hintColor: MyColors.loginLegalText,
                textColor: MyColors.loginTitleDark,
                cursorColor: MyColors.loginTitleDark,
                fontSize: 14.sp,
                height: 56.h,
                width: double.infinity,
                borderRadius: 12.r,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              ),
              14.sbh,
              Text('Gender', style: kProfileLabelText.copyWith(fontSize: 16.sp)),
              10.sbh,
              Row(
                children: [
                  Obx(() => CustomChip(
                        label: Text('Male', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.gender.value == Gender.male ? Colors.white : _chipUnselectedText)),
                        selected: controller.gender.value == Gender.male,
                        onSelected: (_) => controller.gender.value = Gender.male,
                        selectedColor: _chipSelectedBg,
                        backgroundColor: _chipUnselectedBg,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.gender.value == Gender.male ? Colors.white : _chipUnselectedText),
                      )),
                  SizedBox(width: 12.w),
                  Obx(() => CustomChip(
                        label: Text('Female', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.gender.value == Gender.female ? Colors.white : _chipUnselectedText)),
                        selected: controller.gender.value == Gender.female,
                        onSelected: (_) => controller.gender.value = Gender.female,
                        selectedColor: _chipSelectedBg,
                        backgroundColor: _chipUnselectedBg,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.gender.value == Gender.female ? Colors.white : _chipUnselectedText),
                      )),
                  SizedBox(width: 12.w),
                  Obx(() => CustomChip(
                        label: Text('Other', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.gender.value == Gender.other ? Colors.white : _chipUnselectedText)),
                        selected: controller.gender.value == Gender.other,
                        onSelected: (_) => controller.gender.value = Gender.other,
                        selectedColor: _chipSelectedBg,
                        backgroundColor: _chipUnselectedBg,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.gender.value == Gender.other ? Colors.white : _chipUnselectedText),
                      )),
                ],
              ),
              14.sbh,
              Text('Looking for', style: kProfileLabelText.copyWith(fontSize: 16.sp)),
              10.sbh,
              Row(
                children: [
                  Obx(() => CustomChip(
                        label: Text('Men', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.lookingFor.value == LookingFor.men ? Colors.white : _chipUnselectedText)),
                        selected: controller.lookingFor.value == LookingFor.men,
                        onSelected: (_) => controller.lookingFor.value = LookingFor.men,
                        selectedColor: _chipSelectedBg,
                        backgroundColor: _chipUnselectedBg,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.lookingFor.value == LookingFor.men ? Colors.white : _chipUnselectedText),
                      )),
                  SizedBox(width: 12.w),
                  Obx(() => CustomChip(
                        label: Text('Women', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.lookingFor.value == LookingFor.women ? Colors.white : _chipUnselectedText)),
                        selected: controller.lookingFor.value == LookingFor.women,
                        onSelected: (_) => controller.lookingFor.value = LookingFor.women,
                        selectedColor: _chipSelectedBg,
                        backgroundColor: _chipUnselectedBg,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: controller.lookingFor.value == LookingFor.women ? Colors.white : _chipUnselectedText),
                      )),
                ],
              ),
              30.sbh,
              GetBuilder<ProfileController>(
                builder: (_) => CustomButton(
                  text: 'Continue',
                  onPressed: (){
                    debugPrint('${controller.gender.value}');
                    Get.to(() => AddYourPhotosScreen(),);
                   // controller.canContinue ? controller.continueToPhotos : null,
                  },
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
