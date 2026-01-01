import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_2026/widgets/app_color.dart';
import 'package:machine_test_2026/widgets/streak/streak_path.dart';
import '../../view_models/streak_view_model.dart';
import '../../widgets/custom_text.dart';

class StreakView extends GetView<StreakViewModel> {
  const StreakView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(
          text: "My Streak",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontColor: AppColors.kPrimaryColor,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
                child: CustomText(text: controller.errorMessage.value));
          }

          final data = controller.streakData.value;
          if (data == null) {
            return const Center(child: CustomText(text: "No Streak Data"));
          }

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                  text: "Current Streak",
                  fontSize: 18,
                  fontColor: Colors.grey,
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: "${data.currentDay}", 
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  fontColor: Colors.orange,
                ),
                const CustomText(
                  text: "Days in a row",
                  fontSize: 18,
                  fontColor: Colors.grey,
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: buildStreakPath(data.days),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
