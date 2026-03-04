/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 04, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: Photo upload container (Camera / Gallery) with compression.
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/photo_controller.dart';
import '../../utils/values/my_color.dart';

class PhotoUploadContainer extends StatelessWidget {
  const PhotoUploadContainer({super.key});

  static const Color _containerBg = Color.fromRGBO(244, 246, 250, 1);
  static const Color _borderColor = Color.fromRGBO(31, 79, 216, 0.3);
  static const Color _plusIconColor = Color.fromRGBO(30, 58, 132, 1);

  void _showPickSourceSheet(BuildContext context, PhotoController controller) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt_outlined, color: MyColors.loginPrimary),
                title: Text('Camera', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(ctx);
                  controller.pickFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_outlined, color: MyColors.loginPrimary),
                title: Text('Gallery', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(ctx);
                  controller.pickFromGallery();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhotoController>();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => _showPickSourceSheet(context, controller),
            child: Container(
              height: 280.h,
              decoration: BoxDecoration(
                color: _containerBg,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: _borderColor),
              ),
              child: controller.isCompressing.value
                  ? Center(child: CircularProgressIndicator(color: _plusIconColor))
                  : Center(
                      child: Icon(Icons.add, size: 64.r, color: _plusIconColor),
                    ),
            ),
          ),
          if (controller.selectedImages.isNotEmpty) ...[
            SizedBox(height: 16.h),
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.selectedImages.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final file = controller.selectedImages[index];
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.file(
                          file,
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => controller.removeImage(file),
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: Colors.black54,
                            child: Icon(Icons.close, size: 16.r, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ],
      );
    });
  }
}
