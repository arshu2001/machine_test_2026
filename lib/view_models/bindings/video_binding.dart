import 'package:get/get.dart';
import '../video_view_model.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoViewModel>(() => VideoViewModel());
  }
}
