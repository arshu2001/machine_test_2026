import 'package:get/get.dart';
import 'package:machine_test_2026/data/models/streak_model.dart';
import '../../data/repositories/streak_repository.dart';

class StreakViewModel extends GetxController {
  final StreakRepository _repository = StreakRepository();

  final Rx<StreakResponseModel?> streakData = Rx(null);
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final Rx<StreakDay?> selectedDay = Rx<StreakDay?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchStreakData();
  }

  Future<void> fetchStreakData() async {
    try {
      isLoading.value = true;
      final data = await _repository.getStreakData();
      streakData.value = data;

      /// auto-select current day
      selectedDay.value =
          data.days.firstWhereOrNull((e) => e.isCurrent);
    } finally {
      isLoading.value = false;
    }
  }

  void onDayTap(StreakDay day) {
    selectedDay.value = day;
  }
}

