import 'package:machine_test_2026/data/models/streak_model.dart';

import '../services/api_service.dart';
import 'package:get/get.dart';

class StreakRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<StreakResponseModel> getStreakData() async {
    final response = await _apiService.getStreakData();

    if (response is Map<String, dynamic>) {
      return StreakResponseModel.fromJson(response);
    }

    throw Exception("Invalid streak response");
  }
}
