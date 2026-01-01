import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/main_view_model.dart';
import '../home/home_view.dart';
import '../video/video_view.dart';

class MainView extends GetView<MainViewModel> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              HomeView(),
              VideoView(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_outline), label: "My Course"),
            ],
          )),
    );
  }
}
