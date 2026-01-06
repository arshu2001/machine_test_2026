import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildActiveCourseCard(ActiveCourse course) {
  final int progress = course.progress ?? 0;
  
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20.r),
    decoration: BoxDecoration(
      color: const Color(0xFF2B4C9B), // Royal Blueish
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
      ],
    ),
    child: Row(
      children: [
        // Circular Progress
        SizedBox(
          width: 80.w,
          height: 80.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Circle 
              SizedBox(
                width: 80.w, height: 80.w,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 8.w,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white24),
                ),
              ),
              // Progress Circle
              SizedBox(
                width: 80.w, height: 80.w,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 8.w,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                  strokeCap: StrokeCap.round,
                ),
              ),
              // Percentage Text
              CustomText(
                text: "$progress%",
                fontColor: Colors.amber,
                fontSize: 16.spMin,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        
        SizedBox(width: 16.w),
        
        // Info Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              CustomText(
                text: course.title ?? "KTET - Language Teachers",
                fontColor: Colors.white,
                fontSize: 16.spMin,
                fontWeight: FontWeight.bold,
                maxLines: 2,
              ),
              SizedBox(height: 6.h),
              
              // Status Row
              Row(
                children: [
                  Image.asset("assets/images/icon/star.png",height: 18.h,),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: "${course.testCompleted ?? 0}/${course.totaltest ?? 0} Tests", 
                    fontColor: Colors.white70,
                    fontSize: 12.spMin,
                  ),
                ],
              ),
              
              SizedBox(height: 12.h),
              
              // Buttons Row
              Row(
                children: [
                  // Continue Button
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00B7C2), // Cyan/Teal
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Continue >>>>",
                        fontColor: Colors.white,
                        fontSize: 10.spMin,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  
                  // Shift Course Button
                  Expanded(
                     child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00B7C2), // Cyan/Teal
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Shift Course",
                        fontColor: Colors.white,
                        fontSize: 10.spMin,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}