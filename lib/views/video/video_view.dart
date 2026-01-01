import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test_2026/widgets/app_color.dart';
import 'package:video_player/video_player.dart';
import '../../view_models/video_view_model.dart';
import '../../data/models/video_streak_model.dart';
import '../../widgets/custom_text.dart';

class VideoView extends GetView<VideoViewModel> {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
        text: "Mathematics",
        fontSize: 20.spMin,
        fontWeight: FontWeight.bold,
        fontColor: AppColors.kPrimaryColor,
      )),
      body: SafeArea(
        child: Column(
          children: [
            _buildVideoPlayer(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.videos.isEmpty) {
                  return Center(
                      child: CustomText(
                          text: controller.errorMessage.value.isEmpty
                              ? "No Data"
                              : controller.errorMessage.value));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.videos.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _buildVideoItem(controller.videos[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Obx(() {
      if (controller.currentVideo.value == null) {
        return _blackBox("Select a video");
      }

      if (!controller.isVideoInitialized.value) {
        return _loadingBox();
      }

      return AspectRatio(
        aspectRatio: controller.videoPlayerController!.value.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            VideoPlayer(controller.videoPlayerController!),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                controller.videoPlayerController!,
                allowScrubbing: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.isPlaying.value
                    ? controller.videoPlayerController!.pause()
                    : controller.videoPlayerController!.play();
              },
              child: Icon(
                controller.isPlaying.value
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                color: Colors.white,
                size: 60,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _blackBox(String text) {
    return Container(
      height: 200,
      color: Colors.black,
      child: Center(
        child: CustomText(text: text, fontColor: Colors.white),
      ),
    );
  }

  Widget _loadingBox() {
    return Container(
      height: 200,
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  Widget _buildVideoItem(VideoItem video) {
    final isSelected = controller.currentVideo.value?.id == video.id;
    final isLocked = video.isLocked == true;

    return GestureDetector(
      onTap: () {
        if (!isLocked) {
          controller.playVideo(video);
        } else {
          Get.snackbar("Locked",
              "This video is locked. Complete previous modules to unlock.");
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade200),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
          ],
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 80,
                    height: 60,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.play_circle_outline,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ),
                ),
                if (isLocked)
                  Container(
                    width: 80,
                    height: 60,
                    color: Colors.black54,
                    child: const Icon(Icons.lock, color: Colors.white),
                  )
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: video.title ?? "Video Title",
                    fontWeight: FontWeight.bold,
                    fontColor: isLocked ? Colors.grey : Colors.black,
                  ),
                  CustomText(
                    text: video.description ?? "Duration: 10 mins",
                    fontSize: 12,
                    fontColor: Colors.grey[600],
                  ),
                ],
              ),
            ),
            if (video.isCompleted == true)
              const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
