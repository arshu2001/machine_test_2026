import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/routes/app_pages.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildHeader(UserData? user) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: user?.greeting ?? '',
            fontSize: 14.spMin,
            fontWeight: FontWeight.w600,
            style: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
        ],
      ),

      Row(
        children: [
          /// Streak Button
          InkWell(
            onTap: () => Get.toNamed(Routes.STREAK),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                   CustomText(
                    text: "Day ${user?.streakDays ?? 7} ",
                    fontWeight: FontWeight.bold,
                    fontSize: 14.spMin,
                    fontColor: Colors.black,
                  ),
                  CustomText(
                    text: user?.streakIcon ?? "🔥",
                    fontSize: 14.spMin,
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(width: 10.w),

          /// Notification Button
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.notifications_none_outlined, size: 24.spMin, color: Colors.black),
                Positioned(
                  top: 10.h, 
                  right: 12.w,
                  child: Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF5630),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}
