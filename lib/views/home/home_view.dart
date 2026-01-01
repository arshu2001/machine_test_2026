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
import '../../view_models/home_view_model.dart';
import '../../data/models/home_model.dart';
import '../../widgets/custom_text.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
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
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(data.userdata),
                SizedBox(height: 20.h),
                if (data.heroBanners != null &&
                    data.heroBanners!.isNotEmpty) ...[
                  buildHeroBanners(data.heroBanners!),
                  SizedBox(height: 20.h),
                ],
                if (data.activeCourse != null) ...[
                  buildActiveCourseCard(data.activeCourse!),
                  SizedBox(height: 20.h),
                ],
                buildSectionTitle("Categories"),
                SizedBox(height: 10.h),
                _buildCategories(data.categories),
                SizedBox(height: 20.h),
                buildSectionTitle("Most Popular Courses"),
                SizedBox(height: 10.h),
                buildPopularCourses(popularCoursesDisplay),
                SizedBox(height: 20.h),
                if (data.community != null) ...[
                  buildSectionTitle("Community"),
                  SizedBox(height: 10.h),
                  buildCommunitySection(data.community!),
                  SizedBox(height: 20.h),
                ],
                if (data.testimonials != null &&
                    data.testimonials!.isNotEmpty) ...[
                  buildSectionTitle("What Our Students Say"),
                  SizedBox(height: 10.h),
                  buildTestimonialsSection(data.testimonials!),
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
    );
  }

  Widget _buildCategories(List<Category>? categories) {
    if (categories == null || categories.isEmpty) return const SizedBox();

    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = controller.selectedCategoryIndex.value == index;
          return GestureDetector(
            onTap: () => controller.selectCategory(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300),
              ),
              child: CustomText(
                text: cat.name ?? "",
                fontColor: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.spMin,
              ),
            ),
          );
        },
      ),
    );
  }
}
