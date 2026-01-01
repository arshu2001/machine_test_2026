import '../services/api_service.dart';
import '../models/home_model.dart';
import 'package:get/get.dart';

class HomeRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<HomeData> getHomeData() async {
    final response = await _apiService.getHomeData();
    if (response is Map<String, dynamic>) {
      // The response map IS the home data
      return HomeData.fromJson(response);
    } else {
       throw Exception("Invalid response format");
    }
  }
}
