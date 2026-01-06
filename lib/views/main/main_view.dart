import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_2026/widgets/app_color.dart';
import '../../view_models/main_view_model.dart';
import '../home/home_view.dart';
import '../video/video_view.dart';

class MainView extends GetView<MainViewModel> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomeView(),
            VideoView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.kWhite,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: AppColors.ktheme,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/icon/home.png",
                width: 24,
                height: 24,
              ),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              label: "My Course",
            ),
          ],
        ),
      ),
    );
  }
}
