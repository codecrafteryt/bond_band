/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Add your photos screen.
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/photo_controller.dart';
import '../../utils/extentions/extension.dart';
import '../../utils/values/my_color.dart';
import '../../utils/values/my_fonts.dart';
import '../../utils/values/style.dart';
import 'write_your_bio_screen.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/photo_upload_container.dart';

class AddYourPhotosScreen extends StatelessWidget {
  const AddYourPhotosScreen({super.key});

  static const Color _tipBg = Color.fromRGBO(244, 246, 250, 1);

  @override
  Widget build(BuildContext context) {
    final PhotoController controller = Get.find<PhotoController>();
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
                'Add your photos',
                style: kProfileTitleText.copyWith(fontSize: 30),
              ),
              6.sbh,
              Text(
                'Upload at least 1 photo to continue',
                style: kProfileSubtitleText.copyWith(fontSize: 16, color: MyColors.loginLegalText),
              ),
              30.sbh,
              const PhotoUploadContainer(),
              30.sbh,
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: _tipBg,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.loginTitleDark,
                      fontFamily: MyFonts.inter,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Tip: ',
                        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Profiles with multiple clear photos get 3x more matches!',
                      ),
                    ],
                  ),
                ),
              ),
              30.sbh,
              Obx(
                () => CustomButton(
                  text: 'Continue',
                  onPressed: controller.hasAtLeastOneImage ? () {
                    Get.to(() => const WriteYourBioScreen());
                  } : null,
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
