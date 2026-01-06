import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_2026/data/models/streak_model.dart';
import 'package:machine_test_2026/widgets/streak/day_bubble.dart';
import 'package:machine_test_2026/widgets/streak/path_painter.dart';
import 'package:machine_test_2026/widgets/streak/topic_card.dart';
import '../../view_models/streak_view_model.dart';

class StreakPage extends GetView<StreakViewModel> {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA6F2F8),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final days = controller.streakData.value!.days;

        return SingleChildScrollView(
          reverse: true, //  bottom → top 
          child: SizedBox(
            height: days.length * 130.0 + 200,
            child: Stack(
              children: [
                /// dotted path
                CustomPaint(
                  size: Size(
                    MediaQuery.of(context).size.width,
                    days.length * 130.0 + 200,
                  ),
                  painter: StreakPathPainter(days.length),
                ),

                /// dat bubbles
                ...List.generate(days.length, (index) {
                  final day = days[index];
                  final pos = _dayPosition(index, days.length);


                  return Positioned(
                    left: pos.dx,
                    top: pos.dy,
                    child: GestureDetector(
                      onTap: () => controller.onDayTap(day),
                      child: DayBubble(day: day),
                    ),
                  );
                }),

                /// tocpic card
                if (controller.selectedDay.value != null)
                  _buildTopicPopup(days),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTopicPopup(List<StreakDay> days) {
    final day = controller.selectedDay.value!;
    final index = days.indexOf(day);
    final pos = _dayPosition(index, days.length);


    return Positioned(
      left: pos.dx + 70,
      top: pos.dy - 10,
      child: TopicCard(day: day),
    );
  }

  /// zig-zag layout like image
  Offset _dayPosition(int index, int totalDays) {
  const double startY = 100;
  const double gap = 130;

  final int visualIndex = totalDays - 1 - index;
  final bool isLeft = visualIndex % 2 == 0;

  final double x = isLeft ? 60.0 : 230.0;
  final double y = startY + visualIndex * gap;

  return Offset(x, y);
}

}











