// /*
/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 03, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: custom card
*/

// import 'package:braelo_app/controller/home_controller/home_controller.dart';
// import 'package:braelo_app/utils/extensions/extentions.dart';
// import 'package:braelo_app/utils/values/my_color.dart';
// import 'package:braelo_app/utils/values/style.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class CustomCard extends StatelessWidget {
//   final HomeController controller = Get.find();
//   final imageUrl;
//   final String category;
//   final String? subcategory;
//   final List<String>? picture;
//   final String title;
//   final String location;
//   final String price;
//   final bool isSaved;
//   final VoidCallback? onTap;
//   final String? listingId;
//   final bool showFavorite;
//   CustomCard({
//     super.key,
//     this.imageUrl,
//     required this.category,
//     this.subcategory,
//     required this.title,
//     required this.location,
//     required this.price,
//     this.isSaved = false,
//     this.onTap,
//     this.listingId,
//     this.showFavorite = false,
//     this.picture,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: MyColors.white,
//         border: Border.all(
//           color: MyColors.darkWhite,
//           width: 1.0,
//         ),
//         borderRadius: BorderRadius.circular(15.0.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2.0,
//             blurRadius: 5.0,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(5.0.w),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(12.r),
//                       bottom: Radius.circular(12.r)),
//                   child: CachedNetworkImage(
//                     imageUrl:  imageUrl.isNotEmpty  ? imageUrl
//                         : 'https://images.unsplash.com/photo-1234567890abcd.jpg',
//                     width: double.infinity,
//                     height: 130.h,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) =>
//                     const Center(child: CircularProgressIndicator(
//                       backgroundColor: MyColors.primary,
//                       color: Colors.white,
//                     )),
//                     errorWidget: (context, url, error) =>
//                     const Icon(Icons.error),
//                   ),
//                   // Image.network(
//                   //   imageUrl.isNotEmpty
//                   //       ? imageUrl
//                   //       : 'https://images.unsplash.com/photo-1234567890abcd.jpg',
//                   //   height: 170.h, // Set height for the image
//                   //   width: double.infinity,
//                   //   fit: BoxFit.cover,
//                   // ),
//                 ),
//               ),
//               Positioned(
//                 top: 10.h,
//                 left: 10.w,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
//                   decoration: BoxDecoration(
//                     color: MyColors.primary2,
//                     borderRadius: BorderRadius.circular(12.0.r),
//                   ),
//                   child: FittedBox(
//                     // Dynamically adjusts width based on this text
//                     child: Text(
//                       category.tr,
//                       textAlign: TextAlign.center,
//                       style: kSize11DarkW500Text.copyWith(
//                         color: MyColors.white,
//                         fontSize: 8.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               if (showFavorite && listingId != null)
//                 Positioned(
//                   top: 10.h,
//                   right: 10.w,
//                   child: Obx(() => GestureDetector(
//                     onTap: () => controller.toggleSave(
//                       listingId: listingId.toString(),
//                       category: category,
//                       subcategory: subcategory.toString(),
//                       title: title,
//                       location: location,
//                       price: price,
//                       pictures: picture ?? [], // Use `picture` list
//                     ),
//                     child: Container(
//                       width: 22.w,
//                       height: 22.h,
//                       decoration: BoxDecoration(
//                         color: controller.savedListings.contains(listingId)
//                             ? MyColors.primary
//                             : MyColors.primary2,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         controller.savedListings.contains(listingId)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         size: 18.r,
//                         color: MyColors.white,
//                       ),
//                     ),
//                   )),
//                 ),
//
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(2.0.w),
//                   child: Text(
//                     title.tr,
//                     style: kSize11DarkW500Text.copyWith(
//                       fontSize: 9.sp,
//                       color: const Color.fromRGBO(16, 24, 40, 1),
//                     ),
//                     overflow: TextOverflow
//                         .ellipsis, // Ensures the text doesn't overflow
//                     maxLines:
//                     2, // Set a limit for how many lines the title can take
//                   ),
//                 ),
//                 15.sbh,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.location_on_outlined,
//                       size: 11.h,
//                       color: const Color.fromRGBO(175, 175, 175, 1),
//                     ),
//                     4.sbw,
//                     // Wrap location text in Flexible to make it adaptable
//                     Flexible(
//                       child: Text(
//                         location,
//                         style: kSize16DarkW600Text.copyWith(
//                           color: const Color.fromRGBO(175, 175, 175, 1),
//                           fontSize: 9.sp,
//                         ),
//                         overflow: TextOverflow
//                             .ellipsis, // Ensures the text doesn't overflow
//                         maxLines: 1, // Limits to a single line
//                       ),
//                     ),
//                     const Spacer(), // Push the price to the end
//                     // Wrap price in Flexible for flexibility
//                     Flexible(
//                       child: Text(
//                         "\$$price",
//                         overflow: TextOverflow
//                             .ellipsis, // Ensures the text doesn't overflow
//                         maxLines: 1, // Limits to a single line
//                         style: kSize16DarkW600Text.copyWith(
//                           color: const Color.fromRGBO(215, 142, 0, 1),
//                           fontSize: 9.sp,
//                         ),
//                         textAlign: TextAlign
//                             .right, // Align to the right for a cleaner look
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
