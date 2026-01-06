import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
               CircleAvatar(
                 radius: 24.r,
                 backgroundColor: const Color(0xFF00B7C2), // Teal color
                 child: const Icon(Icons.groups, color: Colors.white, size: 28),
               ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: community.name ?? "Community", 
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black,
                    ),
                    CustomText(
                      text: "${community.activeMembers ?? 0} active members", 
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
            text: community.description ?? "Join our community to connect with others.",
            fontColor: Colors.grey[800],
             height: 1.5,
            fontSize: 14.spMin,
            maxLines: 4,
          ),
          SizedBox(height: 20.h),
          
          // Join Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5FDFF), // Light Cyan
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              child: CustomText(
                text: community.action ?? "Join Discussion",
                fontSize: 16.spMin,
                fontColor: const Color(0xFF00B7C2), // Teal
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          
          SizedBox(height: 20.h),
          

          // Bottom Stats
          Row(
            children: [
              if (community.recentActivity?.recentMembers != null)
                SizedBox(
                  height: 30.h,
                  width: 70.w, // Adjusted width
                  child: Stack(
                    children: [
                       for (int i = 0; i < (community.recentActivity!.recentMembers!.length > 3 ? 3 : community.recentActivity!.recentMembers!.length); i++) 
                        Positioned(
                          left: i * 18.0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: CircleAvatar(
                               radius: 12.r,
                               backgroundImage: NetworkImage(community.recentActivity!.recentMembers![i].avatar ?? ""), 
                               backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              if (community.recentActivity?.recentPosts != null)
                CustomText(
                  text: "${community.recentActivity!.recentPosts} recent posts",
                  fontSize: 12.spMin,
                  fontColor: Colors.grey,
                ),
              const Spacer(),
              CustomText(
                text: community.recentActivity?.status ?? "Active now",
                fontSize: 12.spMin,
                fontColor: const Color(0xFF00B7C2), // Teal
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }