  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/routes/app_pages.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildPopularCourses(List<Course>? courses) {
    if (courses == null || courses.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h),
          child: CustomText(text: "No courses found.", fontSize: 16.spMin),
        ),
      );
    }

    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
           final course = courses[index];
           return GestureDetector(
             onTap: () => Get.toNamed(Routes.VIDEO),
             child: Container(
               width: 180.w,
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
                    Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                        image: course.image != null ? DecorationImage(
                          image: NetworkImage(course.image!),
                          fit: BoxFit.cover,
                          onError: (_, __) => {}, // Handle error
                        ) : null,
                      ),
                      child: course.image == null ? const Center(child: Icon(Icons.image)) : null,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: course.title ?? "Unknown",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.spMin,
                          ),
                          SizedBox(height: 4.h),
                          // Text("${course.author} • ${course.rating} ★", style: TextStyle(fontSize: 12, color: Colors.grey[600])), // Fields removed in new model
                          SizedBox(height: 8.h),
                           CustomText(
                            text: "Know more", // Placeholder or from API if avail
                            fontWeight: FontWeight.bold,
                            fontColor: Colors.blue,
                            fontSize: 14.spMin,
                          ),
                        ],
                      ),
                    ),
                 ],
               ),
             ),
           );
        },
      ),
    );
  }