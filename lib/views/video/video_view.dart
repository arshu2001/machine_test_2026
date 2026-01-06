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
      backgroundColor: const Color(0xFFDFFCFF), 
      appBar: AppBar(
        backgroundColor: AppColors.kWhite, 
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Video Player Section
            _buildVideoPlayer(),
            
            // Info & List Section
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                final current = controller.currentVideo.value;
                if (controller.videos.isEmpty) {
                  return Center(
                      child: CustomText(
                          text: controller.errorMessage.value.isEmpty
                              ? "No Data"
                              : controller.errorMessage.value));
                }

                return SingleChildScrollView(
                  padding: EdgeInsets.zero, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Current Video Details Details
                      if (current != null) ...[
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: current.title ?? "Video Title",
                                      fontSize: 18.spMin,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 4.h),
                                    CustomText(
                                      text: current.description ?? "Understanding the basics",
                                      fontSize: 12.spMin,
                                      fontColor: Colors.grey[700],
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              // Download Button
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey.shade200),
                                  boxShadow: [
                                     BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
                                  ]
                                ),
                                child: const Icon(Icons.download, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Journey Section 
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Journey Title
                            CustomText(
                              text: "Meditation Journey",
                               fontSize: 18.spMin,
                               fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 16.h),
      
                            // Timeline List
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.videos.length,
                              itemBuilder: (context, index) {
                                return _buildTimelineItem(
                                  controller.videos[index], 
                                  index, 
                                  controller.videos.length
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
         return AspectRatio(
           aspectRatio: 16/9,
           child: Container(
             color: Colors.black,
             child: const Center(child: CustomText(text: "Select a video", fontColor: Colors.white)),
           ),
         );
      }

      final isInitialized = controller.isVideoInitialized.value;
      
      return AspectRatio(
        aspectRatio: isInitialized && controller.videoPlayerController != null
            ? controller.videoPlayerController!.value.aspectRatio 
            : 16/9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isInitialized)
              VideoPlayer(controller.videoPlayerController!)
            else 
              Container(color: Colors.black, child: const Center(child: CircularProgressIndicator(color: Colors.white))),

             // Play/Pause Overlay
            if(isInitialized)
              GestureDetector(
                onTap: () {
                  controller.isPlaying.value
                      ? controller.videoPlayerController!.pause()
                      : controller.videoPlayerController!.play();
                },
                child: Icon(
                  controller.isPlaying.value
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled, // Or play_arrow rounded
                  color: Colors.white.withOpacity(0.7),
                  size: 60,
                ),
              ),

             // Progress Indicator
             if(isInitialized)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: VideoProgressIndicator(
                  controller.videoPlayerController!,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.white,
                    bufferedColor: Colors.white24,
                    backgroundColor: Colors.grey.shade800,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildTimelineItem(VideoItem video, int index, int total) {
    final isLocked = video.isLocked == true;
    final isCompleted = video.isCompleted == true; 
    final isLast = index == total - 1;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Timeline Column
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isCompleted ? const Color(0xFF2FA2B1) : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isLocked ? Colors.transparent : const Color(0xFF2FA2B1),
                    ),
                     boxShadow: [
                       if(isLocked) const BoxShadow(color: Colors.black12, blurRadius: 4),
                    ]
                  ),
                  child: Center(
                    child: isLocked 
                       ? const Icon(Icons.lock, size: 16, color: Colors.grey)
                       : isCompleted 
                          ? const Icon(Icons.check, size: 20, color: Colors.white)
                          : Container( 
                              width: 12, height: 12,
                              decoration: const BoxDecoration(color: Color(0xFF2FA2B1), shape: BoxShape.circle),
                            ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: CustomPaint(
                      painter: DottedLinePainter(),
                    ),
                  ),
              ],
            ),
          ),
          
          SizedBox(width: 12.w),
          
          // Right Content Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () {
                   if (!isLocked) {
                    controller.playVideo(video);
                  } else {
                    Get.snackbar("Locked",
                        "This video is locked. Complete previous modules to unlock.");
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             CustomText(
                               text: video.title ?? "Video ${index+1}",
                               fontWeight: FontWeight.bold,
                               fontSize: 16.spMin,
                             ),
                             SizedBox(height: 4.h),
                             CustomText(
                               text: video.description ?? "Understanding Basics",
                               fontSize: 12.spMin,
                               fontColor: Colors.grey[600],
                             ),
                          ],
                        ),
                      ),
                      
                      // Trailing Play Icon
                      Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(Icons.play_arrow, size: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2FA2B1).withOpacity(0.5)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final double dashWidth = 4;
    final double dashSpace = 4;
    double startY = 4; 
    final double x = size.width / 2;
    
    while (startY < size.height) {
      canvas.drawLine(Offset(x, startY), Offset(x, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
