import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildTestimonialsSection(List<Testimonial> testimonials) {
    return SizedBox(
      height: 160.h,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        itemCount: testimonials.length,
        itemBuilder: (context, index) {
          final item = testimonials[index];
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.grey.shade200),
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
                      radius: 20.r,
                      backgroundImage: item.learner?.avatar != null 
                        ? NetworkImage(item.learner!.avatar!) 
                        : null,
                      child: item.learner?.avatar == null ? const Icon(Icons.person) : null,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: item.learner?.name ?? "Learner",
                            fontWeight: FontWeight.bold,
                            fontSize: 14.spMin,
                          ),
                          Icon(Icons.format_quote, color: Colors.blue, size: 20.spMin),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: CustomText(
                    text: item.review ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 12.spMin),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }