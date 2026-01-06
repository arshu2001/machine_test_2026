import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildSupportSection(Support support) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      color: const Color(0xFFF9FBFC), // Very light background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: support.title ?? "", 
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black,
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: support.description ?? "", 
                      fontSize: 14.spMin,
                      fontColor: Colors.grey[600],
                      height: 1.4,
                    ),
                     SizedBox(height: 8.h),
                    CustomText(
                      text: "“${support.exampleQuestion}”",
                      fontSize: 14.spMin,
                       fontColor: Colors.grey[600],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                   height: 120.h,
                   alignment: Alignment.centerRight,
                   child: Stack(
                     alignment: Alignment.bottomCenter,
                     children: [
                       Container(
                         width: 100.w,
                         height: 100.h,
                         decoration: const BoxDecoration(
                           color: Color(0xFFFFE3E2), 
                           shape: BoxShape.circle,
                         ),
                       ),
                       if (support.illustration != null)
                        Image.network(
                          support.illustration!,
                          height: 110.h,
                          width: 110.w,
                          errorBuilder: (_,__,___) => const Icon(Icons.support_agent, size: 50, color: Colors.brown,),
                        ),
                     ],
                   ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 24.h),
          
          // Bottom Buttons
          Row(
            children: [
              Expanded(
                child: Container(
                   height: 50.h,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(16.r),
                     border: Border.all(color: Colors.grey.shade300),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Icon(Icons.chat_bubble_outline, color: Colors.black),
                       SizedBox(width: 8.w),
                       CustomText(
                         text: support.actions?.isNotEmpty == true
      ? support.actions!.first.label ?? ''
      : '',
                         fontSize: 14.spMin,
                         fontWeight: FontWeight.bold,
                         fontColor: Colors.black,
                       ),
                     ],
                   ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Container(
                   height: 50.h,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.grey.shade300),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Icon(Icons.phone_outlined, color: Colors.black),
                        SizedBox(width: 8.w),
                       CustomText(
                         text: support.actions?.length == 2
      ? support.actions![1].label ?? '': '',
                         fontSize: 14.spMin,
                         fontWeight: FontWeight.bold,
                         fontColor: Colors.black,
                       ),
                     ],
                   ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }