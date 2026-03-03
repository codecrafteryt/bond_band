// import 'dart:ui';
//
// import 'package:braelo_app/controller/auth_controller/auth_controller.dart';
// import 'package:braelo_app/utils/extensions/extentions.dart';
// import 'package:braelo_app/utils/values/my_color.dart';
// import 'package:braelo_app/utils/values/my_fonts.dart';
// import 'package:braelo_app/views/auth/login_with_email_screen/login_with_email_screen.dart';
// import 'package:braelo_app/views/widgets/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../utils/values/style.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/custom_leading_icon.dart';
//
// class SignupScreen extends StatelessWidget {
//   // Declare the unique GlobalKey for the form
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   AuthController controller = Get.find();
//   SignupScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         controller.clearSignupFields();
//         return true; // Allows the pop action to 5
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: MyColors.background,
//               elevation: 0,
//               leading: CustomLeadingIcon(
//                 onPressed: (){
//                   controller.clearSignupFields();
//                   Get.back();
//                 },
//               ),
//               pinned: false,
//               floating: true,
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Center(
//                   child: Text(
//                     'Create Account'.tr,
//                     style: kSize18DarkW800Text.copyWith(
//                       fontSize: 28.sp,
//                       color: MyColors.black
//                     )
//                   ),
//                 ),
//                 10.sbh,
//                 Center(
//                   child: Text(
//                     "Please fill in the information below\n  to create an account. It's a snap!".tr,
//                     style: kSize16DarkW600Text.copyWith(
//                       color: const Color.fromRGBO(108, 108, 108, 1),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 // Assign the unique GlobalKey to the Form widget
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       30.sbh,
//                       CustomTextField(
//                         hintText: "Full Name".tr,
//                         controller: controller.fullNameController,
//                         textColor: MyColors.black,
//                         cursorColor: MyColors.black,
//                         borderColor: MyColors.darkWhite,
//                         focusedBorderColor: MyColors.darkWhite,
//                         width: 352.w,
//                         height: 75.h,
//                         maxLength: 30,
//                         keyboardType: TextInputType.text,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Full Name cannot be empty'.tr;
//                           }
//                           return null;
//                         },
//                       ),
//                       5.sbh,
//                       CustomTextField(
//                         hintText: "Enter Your Email".tr,
//                         controller: controller.emailController,
//                         textColor: MyColors.black,
//                         cursorColor: MyColors.black,
//                         borderColor: MyColors.darkWhite,
//                         focusedBorderColor: MyColors.darkWhite,
//                         width: 352.w,
//                         height: 75.h,
//                         maxLength: 50,
//                         allowedPattern: r'[a-zA-Z0-9@._-]',
//                         preventSpaces: true,
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Email cannot be empty'.tr;
//                           }
//                           if (!GetUtils.isEmail(value)) {
//                             return 'Please enter a valid email address'.tr;
//                           }
//                           return null;
//                         },
//                       ),
//                       5.sbh,
//                       Obx(() => CustomTextField(
//                         hintText: "Password".tr,
//                         controller: controller.passwordController,
//                         textColor: MyColors.black,
//                         cursorColor: MyColors.black,
//                         borderColor: MyColors.darkWhite,
//                         focusedBorderColor: MyColors.darkWhite,
//                         isObscureText: controller.obscurePassword.value,
//                         width: 352.w,
//                         height: 75.h,
//                         maxLength: 20,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             controller.obscurePassword.value
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: const Color.fromRGBO(117, 120, 141, 1),
//                           ),
//                           onPressed: () {
//                             controller.obscurePassword.value = !controller.obscurePassword.value;
//                           },
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Password cannot be empty'.tr;
//                           }
//                           if (value.length < 8) {
//                             return 'Password must be at least 8 characters long'.tr;
//                           }
//                           // Check if confirm password matches the password
//                           if (value != controller.confirmPasswordController.text) {
//                             return 'Passwords do not match'.tr;
//                           }
//                           return null;
//                         },
//                       )),
//                       5.sbh,
//                       Obx(() => CustomTextField(
//                         hintText: "Confirm Password".tr,
//                         controller: controller.confirmPasswordController,
//                         textColor: MyColors.black,
//                         cursorColor: MyColors.black,
//                         borderColor: MyColors.darkWhite,
//                         focusedBorderColor: MyColors.darkWhite,
//                         isObscureText: controller.obscureConfirmPassword.value,
//                         width: 352.w,
//                         height: 75.h,
//                         maxLength: 20,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             controller.obscureConfirmPassword.value
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: const Color.fromRGBO(117, 120, 141, 1),
//                           ),
//                           onPressed: () {
//                             controller.obscureConfirmPassword.value = !controller.obscureConfirmPassword.value;
//                           },
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Password cannot be empty'.tr;
//                           }
//                           if (value.length < 8) {
//                             return 'Password must be at least 8 characters long'.tr;
//                           }
//                           // Check if confirm password matches the password
//                           if (value != controller.passwordController.text) {
//                             return 'Passwords do not match'.tr;
//                           }
//                           return null;
//                         },
//                       )),
//                       115.sbh,
//                       GestureDetector(
//                         onTap: () {
//                           controller.clearSignupFields();
//                           Get.off(() => LoginWithEmailScreen());
//                         },
//                         child: Text(
//                           "I already have an account".tr,
//                           style: kSize16DarkW600Text.copyWith(
//                             color: MyColors.lightGrey,
//                             fontWeight: FontWeight.normal,
//                             fontFamily: MyFonts.plusJakartaSans,
//                           ),
//                         ),
//                       ),
//                       30.sbh,
//                       CustomButton(
//                         text: 'Next'.tr,
//                         borderRadius: 12.0.r,
//                         padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
//                         textColor: MyColors.white,
//                         backgroundColor: MyColors.primary2,
//                         width: 352.w,
//                         height: 65.h,
//                         onPressed: () {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             controller.signUp();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
