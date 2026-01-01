import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../data/repositories/video_repository.dart';
import '../../data/models/video_streak_model.dart';

class VideoViewModel extends GetxController {
  final VideoRepository _repository = VideoRepository();
  
  final RxList<VideoItem> videos = <VideoItem>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  
  final Rx<VideoItem?> currentVideo = Rx<VideoItem?>(null);
  VideoPlayerController? videoPlayerController;
  final RxBool isVideoInitialized = false.obs;
  final RxBool isPlaying = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final videoResponse = await _repository.getVideoDetails();
      
      if (videoResponse.videos != null && videoResponse.videos!.isNotEmpty) {
        videos.assignAll(videoResponse.videos!);
        final firstPlayable = videos.firstWhereOrNull((v) => v.isLocked != true);
        if (firstPlayable != null) {
          playVideo(firstPlayable);
        }
      } else {
        errorMessage.value = "No videos found.";
      }
    } catch (e) {
      errorMessage.value = "Failed to load videos: $e";
    } finally {
      isLoading.value = false;
    }
  }

  void playVideo(VideoItem video) async {
  if (video.isLocked == true) return;
  if (video.url == null || video.url!.isEmpty) {
    Get.snackbar("Error", "Invalid video URL");
    return;
  }

  print("VIDEO URL => ${video.url}");

  currentVideo.value = video;

  await videoPlayerController?.dispose();
  isVideoInitialized.value = false;
  isPlaying.value = false;

  videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(video.url!));

  try {
    await videoPlayerController!.initialize();
print("VIDEO INITIALIZED => ${videoPlayerController!.value.isInitialized}");
    videoPlayerController!.addListener(() {
      isPlaying.value = videoPlayerController!.value.isPlaying;
    });

    isVideoInitialized.value = true;
    videoPlayerController!.play();
  } catch (e) {
    errorMessage.value = "Video failed to load";
    print("VIDEO ERROR => $e");
  }
}



  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }
}
