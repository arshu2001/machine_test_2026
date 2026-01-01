import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildActiveCourseCard(ActiveCourse course) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFF4A4E69), 
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            CustomText(
             text: course.title ?? "Course",
             fontColor: Colors.white,
             fontSize: 18.spMin,
             fontWeight: FontWeight.bold,
           ),
           SizedBox(height: 8.h),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               CustomText(
                 text: "Progress",
                 fontColor: Colors.white70,
                 fontSize: 14.spMin,
               ),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                 decoration: BoxDecoration(
                   color: Colors.white24,
                   borderRadius: BorderRadius.circular(8.r),
                 ),
                 child: CustomText(text: "${course.progress ?? 0}%", fontColor: Colors.white, fontSize: 12.spMin),
               )
             ],
           ),
           SizedBox(height: 12.h),
           LinearProgressIndicator(
             value: (course.progress ?? 0) / 100,
             backgroundColor: Colors.white24,
             valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
             borderRadius: BorderRadius.circular(4.r),
           ),
         ],
      ),
    );
  }