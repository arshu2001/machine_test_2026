import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/app_color.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

class HeroBannerSection extends StatefulWidget {
  final List<HeroBanner> banners;
  const HeroBannerSection({super.key, required this.banners});

  @override
  State<HeroBannerSection> createState() => _HeroBannerSectionState();
}

class _HeroBannerSectionState extends State<HeroBannerSection> {
  final PageController _controller = PageController(viewportFraction: 0.9); // Retain viewportFraction
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          width: double.infinity,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return Container(
                margin: EdgeInsets.only(right: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: banner.image != null ? DecorationImage(
                    image: NetworkImage(banner.image!),
                    fit: BoxFit.fill,
                  ) : null,
                  color: Colors.blueAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  CustomText(
                      //   text: banner.title ?? "",
                      //   fontSize: 18.spMin,
                      //   style: GoogleFonts.poppins(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                       if (banner.isActive == true)
                         Container(
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
        ),
        SizedBox(height: 12.h),
        
        // Pagination Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.banners.length, (index) {
             return AnimatedContainer(
               duration: const Duration(milliseconds: 300),
               margin: EdgeInsets.symmetric(horizontal: 4.w),
               height: 6.h,
               width: _currentIndex == index ? 24.w : 6.w, // Expanded dot
               decoration: BoxDecoration(
                 color: _currentIndex == index ? AppColors.ksec : Colors.grey.shade300,
                 borderRadius: BorderRadius.circular(3.r),
               ),
             );
          }),
        )
      ],
    );
  }
}