import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/widgets/home_view/active_course_card.dart';
import 'package:machine_test_2026/widgets/home_view/community_section.dart';
import 'package:machine_test_2026/widgets/home_view/header.dart';
import 'package:machine_test_2026/widgets/home_view/hero_banner.dart';
import 'package:machine_test_2026/widgets/home_view/popular_course.dart';
import 'package:machine_test_2026/widgets/home_view/support_section.dart';
import 'package:machine_test_2026/widgets/home_view/testmonial_section.dart';
import 'package:machine_test_2026/widgets/home_view/title.dart';
import 'package:machine_test_2026/widgets/home_view/live_session_card.dart';
import '../../view_models/home_view_model.dart';
import '../../data/models/home_model.dart';
import '../../widgets/custom_text.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          // 1. Teal Wavy Background
           Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300.h, // Approx height
            child: ClipPath(
              clipper: TopWaveClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF00B7C2), // Teal
                      Color(0xFF009CA6), // Darker Teal
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
    
              if (controller.errorMessage.isNotEmpty) {
                return Center(
                    child: CustomText(text: controller.errorMessage.value));
              }
    
              final data = controller.homeData.value;
              if (data == null) return const SizedBox();
    
              final popularCoursesDisplay = controller.currentPopularCourses;
    
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(data.userdata),
                    SizedBox(height: 20.h),
                    if (data.heroBanners != null &&
                        data.heroBanners!.isNotEmpty) ...[
                      HeroBannerSection(banners: data.heroBanners!),
                      SizedBox(height: 20.h),
                    ],
                    buildSectionTitle("Active Coursesr"),
                    SizedBox(height: 10.h),
                    if (data.activeCourse != null) ...[
                      buildActiveCourseCard(data.activeCourse!),
                      SizedBox(height: 20.h),
                    ],
                    buildSectionTitle("Popular Courses"),
                    SizedBox(height: 10.h),
                    _buildCategories(data.categories),
                    SizedBox(height: 20.h),
                    SizedBox(height: 10.h),
                    buildPopularCourses(popularCoursesDisplay),
                    SizedBox(height: 20.h),
                    if (data.liveSession != null) ...[
                       LiveSessionCard(session: data.liveSession!),
                       SizedBox(height: 20.h),
                    ],
                    if (data.community != null) ...[
                      SizedBox(height: 10.h),
                      buildCommunitySection(data.community!),
                      SizedBox(height: 20.h),
                    ],
                    if (data.testimonials != null &&
                        data.testimonials!.isNotEmpty) ...[
                      buildSectionTitle("What Learners Are Saying"),
                      SizedBox(height: 10.h),
                      TestimonialSection(testimonials: data.testimonials!),
                      SizedBox(height: 20.h),
                    ],
                    if (data.support != null) ...[
                      buildSupportSection(data.support!),
                      SizedBox(height: 20.h),
                    ],
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(List<Category>? categories) {
    if (categories == null || categories.isEmpty) return const SizedBox();

    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: List.generate(categories.length, (index) {
        final cat = categories[index];
        final isSelected = controller.selectedCategoryIndex.value == index;
        return GestureDetector(
          onTap: () => controller.selectCategory(index),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF00B7C2) : const Color(0xFFE5FDFF), // Teal vs Light Cyan
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                  color: isSelected ? const Color(0xFF00B7C2) : Colors.transparent),
            ),
            child: CustomText(
              text: cat.name ?? "",
              fontColor: isSelected ? Colors.white : const Color(0xFF00B7C2),
              fontWeight: FontWeight.w500,
              fontSize: 14.spMin,
            ),
          ),
        );
      }),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // Start slightly up from bottom left
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 50);
    
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0); // Top Right
    path.close(); // Close to Top Left
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
