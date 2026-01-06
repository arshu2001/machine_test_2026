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

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.8, 
      ),
      itemCount: courses.length,
      itemBuilder: (context, index) {
         final course = courses[index];
         return GestureDetector(
           onTap: () => Get.toNamed(Routes.VIDEO),
           child: Container(
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(16.r),
               boxShadow: [
                 BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4)),
               ],
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                  // Image Section
                  Expanded(
                    flex: 5,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                         ClipRRect(
                           borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                           child: course.image != null ? Image.network(
                             course.image!,
                             fit: BoxFit.cover,
                             errorBuilder: (c, o, s) => Container(color: Colors.grey.shade200),
                           ) : Container(color: Colors.grey.shade200),
                         ),
                        
                      ],
                    ),
                  ),
                  
                  // Info & Button
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: course.title ?? "Title",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.spMin,
                            fontColor: Colors.black87,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00B7C2), // Teal color
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            alignment: Alignment.center,
                            child: CustomText(
                              text: "Explore More",
                              fontColor: Colors.white,
                              fontSize: 12.spMin,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
               ],
             ),
           ),
         );
      },
    );
  }