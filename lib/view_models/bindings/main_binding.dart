import 'package:get/get.dart';
import '../main_view_model.dart';
import '../home_view_model.dart';
import '../video_view_model.dart';
import '../streak_view_model.dart';
import '../../data/repositories/home_repository.dart'; // Ensure Repos are initialized if not lazy
// Actually, HomeBinding and VideoBinding logic should be merged or called here.
// But Bindings can be hierarchical.

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainViewModel>(() => MainViewModel());
    
    // We need to inject Home and Video dependencies here because they are used in IndexedStack immediately
    // Or we can rely on their own Bindings if we used GetPage properly, but since we use standard widgets in IndexedStack,
    // we must ensure their controllers are bound.
    
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut<VideoViewModel>(() => VideoViewModel());
    Get.lazyPut<StreakViewModel>(() => StreakViewModel());
  }
}
