import 'package:get/get.dart';
import '../main_view_model.dart';
import '../home_view_model.dart';
import '../video_view_model.dart';
import '../streak_view_model.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainViewModel>(() => MainViewModel());
    
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut<VideoViewModel>(() => VideoViewModel());
    Get.lazyPut<StreakViewModel>(() => StreakViewModel());
  }
}
