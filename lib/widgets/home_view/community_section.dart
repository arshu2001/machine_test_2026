import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildCommunitySection(Community community) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10.r),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Icon(Icons.people, color: Colors.blue),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: community.name ?? "Community",
                      fontSize: 16.spMin,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    CustomText(
                      text: "${community.activeMembers ?? 0} Active Members",
                      fontSize: 12.spMin,
                      fontColor: Colors.grey[600],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: community.description ?? "",
            fontColor: Colors.grey[700],
            height: 1.5,
            fontSize: 14.spMin,
          ),
          SizedBox(height: 16.h),
          if (community.recentActivity?.recentMembers != null)
            Row(
              children: [
                SizedBox(
                  height: 30.h,
                  width: 100.w,
                  child: Stack(
                    children: [
                      for (int i = 0; i < community.recentActivity!.recentMembers!.length && i < 3; i++)
                        Positioned(
                          left: i * 20.0,
                          child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(community.recentActivity!.recentMembers![i].avatar ?? ""),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                CustomText(
                  text: community.recentActivity?.status ?? "",
                  fontSize: 12.spMin,
                  fontColor: Colors.grey[600],
                ),
              ],
            ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
              child: CustomText(text: community.action ?? "Join Discussion", fontSize: 14.spMin),
            ),
          ),
        ],
      ),
    );
  }