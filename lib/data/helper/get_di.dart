/*
 ---------------------------------------
 Project: Bond Band Mobile Application
 Date: March 3, 2026
 Author: Ameer Salman
 ---------------------------------------
 Description: Dependency Injection
*/

import 'package:bond_band/controller/auth_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_provider/api_provider.dart';
import '../repo/auth_repo/auth_repo.dart';

class DependencyInjection {
  static void init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences, fenix: true);
    Get.lazyPut(() => ApiProvider());
    Get.lazyPut(() => AuthRepo(apiProvider: Get.find(),),);

    Get.lazyPut(() => AuthController(authRepo: Get.find(), sharedPreferences: Get.find()), fenix: true);

  }
}
