  /*
   ---------------------------------------
   Project: Bond Band Mobile Application
   Date: March 3, 2026
   Author: Ameer Salman
   ---------------------------------------
   Description: Auth Logic.
  */

  import 'package:get/get_state_manager/src/simple/get_controllers.dart';

  import '../data/repo/auth_repo/auth_repo.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  class AuthController extends GetxController {
    AuthRepo authRepo;
    SharedPreferences sharedPreferences;

    AuthController({
      required this.authRepo,
      required this.sharedPreferences,
    });

  }
