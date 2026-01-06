import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/app_color.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

class LiveSessionCard extends StatelessWidget {
  final LiveSession session;

  const LiveSessionCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7), // Light Peach/Beige color
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live Badge
                if (session.isLive == true)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3FC94F),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration:  BoxDecoration(
                            color: AppColors.kWhite,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        CustomText(
                          text: "Live",
                          fontColor: AppColors.kWhite,
                          fontSize: 11.spMin,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 16.h),
                
                // Title
                CustomText(
                  text: session.title ?? "Session Title",
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.bold,
                  fontColor: AppColors.kPrimaryColor,
                ),
                SizedBox(height: 4.h),
                
                // Instructor
                if (session.instructor?.name != null)
                  CustomText(
                    text: session.instructor!.name!,
                    fontSize: 14.spMin,
                    fontColor: Colors.grey[700],
                  ),
                  
                SizedBox(height: 8.h),
                
                // Session Info
                if (session.sessionDetails != null)
                 CustomText(
                    text: "Session ${session.sessionDetails!.sessionNumber ?? 0} • ${session.sessionDetails!.date ?? ''} ${session.sessionDetails!.time ?? ''}",
                    fontSize: 12.spMin,
                    fontColor: Colors.grey[600],
                  ),
              ],
            ),
          ),
          
          // Action Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFF2B93B)),
            ),
            child: CustomText(
              text: session.action ?? "Join Now",
              fontColor: const Color(0xFFF2B93B),
              fontWeight: FontWeight.bold,
              fontSize: 14.spMin,
            ),
          ),
        ],
      ),
    );
  }
}
