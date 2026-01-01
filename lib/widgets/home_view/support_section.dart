import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildSupportSection(Support support) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F1FF), // Light blue background
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: support.title ?? "Have any Questions?",
                      fontSize: 18.spMin,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: support.description ?? "",
                      fontSize: 12.spMin,
                      fontColor: Colors.grey[600],
                    ),
                  ],
                ),
              ),
              if (support.illustration != null)
                SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: Image.network(support.illustration!, errorBuilder: (_,__,___) => const Icon(Icons.support_agent)),
                )
            ],
          ),
          SizedBox(height: 16.h),
           if (support.actions != null && support.actions!.isNotEmpty)
             Row(
               children: support.actions!.map((action) {
                 return Expanded(
                   child: Container(
                     margin: EdgeInsets.only(right: 8.w),
                     child: ElevatedButton.icon(
                       onPressed: () {}, // Implement action
                       icon: CustomText(text: action.icon ?? "", fontSize: 18.spMin), 
                       label: CustomText(text: action.label ?? "Contact", fontSize: 14.spMin),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: action.type == "chat" ? Colors.blue : Colors.green,
                         foregroundColor: Colors.white,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                         padding: EdgeInsets.symmetric(vertical: 10.h),
                       ),
                     ),
                   ),
                 );
               }).toList(),
             ),
        ],
      ),
    );
  }