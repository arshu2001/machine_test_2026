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
            text: user?.name ?? 'User',
            fontSize: 24.spMin,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomText(
            text: user?.greeting ?? '',
            fontSize: 14.spMin,
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          ),
        ],
      ),

      /// 🔥 Streak Button
      InkWell(
        onTap: () => Get.toNamed(Routes.STREAK),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            children: [
              CustomText(
                text: "Day ${user?.streakDays ?? 0} ",
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: user?.streakIcon ?? "",
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
