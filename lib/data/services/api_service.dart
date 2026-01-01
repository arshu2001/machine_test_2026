import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://trogon.info/task/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<dynamic> getHomeData() async {
    try {
      final response = await _dio.get('home.php');
      return response.data;
    } catch (e) {
      print('Error fetching home data: $e');
      rethrow;
    }
  }

  Future<dynamic> getVideoDetails() async {
    try {
      final response = await _dio.get('video_details.php');
      return response.data;
    } catch (e) {
      print('Error fetching video details: $e');
      rethrow;
    }
  }

  Future<dynamic> getStreakData() async {
  try {
    final response = await _dio.get('streak.php');
    return response.data;
  } catch (e) {
    print('Error fetching streak data: $e');
    rethrow;
  }
}

}
