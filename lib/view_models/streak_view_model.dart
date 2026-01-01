import 'package:get/get.dart';
import 'package:machine_test_2026/data/models/streak_model.dart';
import '../../data/repositories/streak_repository.dart';

class StreakViewModel extends GetxController {
  final StreakRepository _repository = StreakRepository();
  
  final Rx<StreakResponseModel?> streakData = Rx<StreakResponseModel?>(null);

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStreakData();
  }

  Future<void> fetchStreakData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final data = await _repository.getStreakData();
      streakData.value = data;
      
    } catch (e) {
      errorMessage.value = "Failed to load streak: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
