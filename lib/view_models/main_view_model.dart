import 'package:get/get.dart';
import '../views/home/home_view.dart';
import '../views/video/video_view.dart';

class MainViewModel extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
