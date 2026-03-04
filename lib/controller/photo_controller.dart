/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Image picker, compression, permissions.
*/

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class PhotoController extends GetxController {
  SharedPreferences sharedPreferences;
  PhotoController({
    required this.sharedPreferences,
  });
  final ImagePicker _picker = ImagePicker();
  final RxList<File> selectedImages = <File>[].obs;
  final RxBool isCompressing = false.obs;

  bool get hasAtLeastOneImage => selectedImages.isNotEmpty;

  Future<bool> _requestCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) return true;
    if (status.isDenied) {
      final result = await Permission.camera.request();
      return result.isGranted;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return false;
  }

  Future<bool> _requestPhotosPermission() async {
    final status = await Permission.photos.status;
    if (status.isGranted) return true;
    if (status.isDenied) {
      final result = await Permission.photos.request();
      return result.isGranted;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return false;
  }

  Future<void> _compressAndAdd(File file) async {
    isCompressing.value = true;
    try {
      final targetPath = p.join(
        Directory.systemTemp.path,
        '${DateTime.now().millisecondsSinceEpoch}_compressed.jpg',
      );
      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 85,
        minWidth: 1024,
        minHeight: 1024,
      );
      if (result != null) {
        selectedImages.add(File(result.path));
      } else {
        selectedImages.add(file);
      }
    } catch (_) {
      selectedImages.add(file);
    } finally {
      isCompressing.value = false;
    }
  }

  Future<void> pickFromCamera() async {
    final granted = await _requestCameraPermission();
    if (!granted) {
      Get.snackbar('Permission', 'Camera permission is required');
      return;
    }
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      await _compressAndAdd(File(photo.path));
    }
  }

  Future<void> pickFromGallery() async {
    final granted = await _requestPhotosPermission();
    if (!granted) {
      Get.snackbar('Permission', 'Photos permission is required');
      return;
    }
    final List<XFile> photos = await _picker.pickMultiImage();
    for (final x in photos) {
      await _compressAndAdd(File(x.path));
    }
  }

  void removeImage(File file) {
    selectedImages.remove(file);
  }

  void clearImages() {
    selectedImages.clear();
  }
}
