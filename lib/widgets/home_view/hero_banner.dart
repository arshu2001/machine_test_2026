import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildHeroBanners(List<HeroBanner> banners) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: banner.image != null ? DecorationImage(
                image: NetworkImage(banner.image!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
              ) : null,
              color: Colors.blueAccent,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomText(
                    text: banner.title ?? "",
                    fontSize: 18.spMin,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   if (banner.isActive == true)
                     Container(
                      //  margin: const EdgeInsets.top(8),
                       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                       decoration: BoxDecoration(
                         color: Colors.white24,
                         borderRadius: BorderRadius.circular(20.r),
                       ),
                       child: CustomText(text: "Active Now", fontColor: Colors.white, fontSize: 10.spMin),
                     )
                ],
              ),
            ),
          );
        },
      ),
    );
  }