import 'package:get/get.dart';
import '../streak_view_model.dart';

class StreakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreakViewModel>(() => StreakViewModel());
  }
}
