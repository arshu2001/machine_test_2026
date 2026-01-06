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
      backgroundColor: AppColors.ktheme,
      body: Stack(
        children: [
          // Main Content
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              _buildPage(
                title: "Smarter Learning \nStarts Here",
                description: "Personalized lessons that adapt to \nyour pace and goals.",
                imagePath: "assets/images/person/person1.png",
              ),
               _buildPage(
                title: "Learn. Practice. \nSucceed.",
                description: "Structured content, mock tests, and \nprogress tracking in one place.",
                imagePath: "assets/images/person/person2.png", 
              ),
            ],
          ),
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            child: _buildBottomControls(),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Stack(
      children: [
        // Person Image
        Positioned(
          top: 0.12.sh, 
          left: 0,
          right: 0,
          bottom: 0.35.sh, 
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
             errorBuilder: (context, error, stackTrace) => 
               const Icon(Icons.person, size: 150, color: Colors.white),
          ),
        ),

        //  White Bottom Container 
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 0.40.sh, 
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: TopHillClipper(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
              
             
              Positioned(
                top: -30, 
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.ktheme, 
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Image.asset("assets/images/logo/logo.png", height: 34.h),
                ),
              ),

              // Text Content
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 50.h, 24.w, 80.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: title,
                      textAlign: TextAlign.center,
                      fontSize: 20.spMin,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.kPrimaryColor,
                      letterSpacing: 0.8,
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: description,
                      textAlign: TextAlign.center,
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.kPrimaryColor,
                      height: 1.5,
                      maxLines: 3,
                      letterSpacing: 0.8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Obx(() {
        final isLastPage = controller.currentPage.value == 1;
        return Column(
          children: [
             // Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: controller.currentPage.value == index ? 8.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? AppColors.ktheme
                        : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
             SizedBox(height:20.h),
            
            // Next Button
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
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
                  backgroundColor: AppColors.ktheme,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  elevation: 0,
                ),
                child: CustomText(
                  text: isLastPage ? "Get Started" : "Next",
                  fontSize: 16.spMin,
                  fontColor: AppColors.kWhite,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            // SizedBox(height: 10.h),
            
            // Skip Button
            TextButton(
              onPressed: controller.skip,
              child: CustomText(
                text: "Skip",
                fontSize: 17.spMin,
                fontColor: AppColors.ktheme,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
              ),
            ),
             SizedBox(height: 10.h),
          ],
        );
      }),
    );
  }
}

class TopHillClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start slightly down
    path.moveTo(0, 40); 
    path.quadraticBezierTo(size.width / 2, -30, size.width, 40);
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
