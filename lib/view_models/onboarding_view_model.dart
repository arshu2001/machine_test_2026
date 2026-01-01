import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/storage_service.dart';
import '../../routes/app_pages.dart';

class OnboardingViewModel extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final PageController pageController = PageController();
  
  final RxInt currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    if (currentPage.value == 0) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding();
    }
  }

  void skip() {
    completeOnboarding();
  }

  void completeOnboarding() {
    _storageService.setOnboardingComplete(true);
    Get.offAllNamed(Routes.MAIN);

  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
