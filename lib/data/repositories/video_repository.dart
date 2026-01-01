import '../services/api_service.dart';
import '../models/video_streak_model.dart';
import 'package:get/get.dart';

class VideoRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<VideoResponse> getVideoDetails() async {
    final response = await _apiService.getVideoDetails();
    if (response is Map<String, dynamic>) {
       return VideoResponse.fromJson(response);
    }
    // If it's just a root list (unlikely based on my JSON inspection, but possible)
    throw Exception("Unexpected video response format");
  }
}
