/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Onboarding screens (4 pages).
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../utils/values/my_color.dart';
import '../../utils/values/my_images.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const List<String> _pageImages = [
    MyImages.onboarding1,
    MyImages.onboarding2,
    MyImages.onboarding3,
    MyImages.onboarding4,
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: OnboardingController.totalPages,
            itemBuilder: (context, index) {
              return Image.asset(
                _pageImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 24.w, top: 12.h),
                    child: TextButton(
                      onPressed: controller.skip,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Obx(() => _buildDots(controller.currentPage.value)),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Obx(
                    () => CustomButton(
                      text: controller.currentPage.value ==
                              OnboardingController.totalPages - 1
                          ? 'Get Started'
                          : 'Continue',
                      onPressed: controller.nextPage,
                      backgroundColor: MyColors.white,
                      textColor: MyColors.onboardingButtonText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      suffixIcon: Icons.keyboard_arrow_right_outlined,
                      iconColor: MyColors.onboardingButtonText,
                      iconSize: 18.r,
                      borderRadius: 16.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDots(int currentIndex) {
    const double dotSize = 8;
    const double activeWidth = 24;
    const double activeHeight = 8;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnboardingController.totalPages,
        (index) {
          final isActive = currentIndex == index;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: isActive ? activeWidth.w : dotSize.w,
            height: isActive ? activeHeight.w : dotSize.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((isActive ? activeHeight : dotSize) / 2),
              color: MyColors.white,
            ),
          );
        },
      ),
    );
  }
}
