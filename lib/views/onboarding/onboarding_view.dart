import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test_2026/widgets/app_color.dart';
import '../../view_models/onboarding_view_model.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_text.dart';

class OnboardingView extends GetView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: [
                  _buildPage(
                    title: "Smarter Learning Starts Here",
                    description: "Access a world of knowledge at your fingertips.",
                    image: Icons.school,
                  ),
                  _buildPage(
                    title: "Learn. Practice. Succeed.",
                    description: "Achieve your goals with our structured learning paths.",
                    image: Icons.menu_book,
                  ),
                ],
              ),
            ),
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required IconData image,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(image, size: 150, color: Colors.blueAccent),
          const SizedBox(height: 40),
          CustomText(
            text: title,
            textAlign: TextAlign.center,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontColor: Colors.black87,
          ),
          const SizedBox(height: 16),
          CustomText(
            text: description,
            textAlign: TextAlign.center,
            fontSize: 16,
            fontColor: Colors.black54,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Obx(() {
        final isLastPage = controller.currentPage.value == 1;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip Button 
            TextButton(
              onPressed: controller.skip,
              child: const CustomText(text: "Skip", fontSize: 16),
            ),

            //  Page Indicator
            Row(
              children: List.generate(2, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentPage.value == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? Colors.blue
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            // Next / Get Started Button
            ElevatedButton(
              onPressed: () {
                if (isLastPage) {
                  controller.completeOnboarding();
                  Get.offAllNamed(Routes.MAIN);
                } else {
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: CustomText(text: isLastPage ? "Get Started" : "Next", fontSize: 16.spMin,fontColor: AppColors.kWhite,),
            ),
          ],
        );
      }),
    );
  }
}
