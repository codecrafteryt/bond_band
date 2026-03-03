/*
 ---------------------------------------
 Project: Bond Band Mobile Application
 Date: March 3, 2026
 Author: Ameer Salman
 ---------------------------------------
 Description: Repo logic's for auth module
*/

import 'package:bond_band/data/api_provider/api_provider.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxService {
  ApiProvider apiProvider;
  AuthRepo({required this.apiProvider});

}