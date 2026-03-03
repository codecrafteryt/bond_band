/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 03, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Splash Screen UI and some logic.
*/
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   // _checkLoginStatus();
    //statusCheck();
  }

  // statusCheck() {
  //   Timer(const Duration(seconds: 2), () async {
  //     if (
  //     Get.find<AuthController>().sharedPreferences.getBool("firstTimeWalkThrough") ?? true) {
  //       Get.find<AuthController>().sharedPreferences.setBool("firstTimeWalkThrough", false);
  //       Get.offAll(() => OnboardingScreen());
  //     } else {
  //       if (Get.find<AuthController>().sharedPreferences.getString(
  //           Constants.refreshToken) == null || Get.find<AuthController>().sharedPreferences.getString(Constants.refreshToken) == "")
  //       {
  //         Get.offAll(() => const LoginScreen());
  //       } else {
  //         print("my refresh token${Get.find<AuthController>().sharedPreferences.getString(Constants.refreshToken)}");
  //         Get.find<AuthController>().checkSession1();
  //
  //       }
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );

    //   Scaffold(
    //   backgroundColor: MyColors.primary,
    //   body: Stack(
    //     children: [
    //       Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.all(10.0.w),
    //               child: Image.asset(
    //                 'assets/images/logo.png',
    //                 width: 200.w,
    //               ),
    //             ),
    //             20.sbh,
    //             const CircularProgressIndicator(
    //               strokeWidth: 5,
    //               valueColor: AlwaysStoppedAnimation<Color>(
    //                 MyColors.black,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Positioned(
    //         bottom: 150,
    //         left: 0,
    //         right: 0,
    //         child: Text(
    //           "Version: 1.0.2",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: MyColors.black,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
