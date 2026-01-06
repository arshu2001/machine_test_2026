import 'package:flutter/material.dart';
import 'package:machine_test_2026/data/models/streak_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

class DayBubble extends StatelessWidget {
  final StreakDay day;

  const DayBubble({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final Color color = day.isCurrent
        ? const Color(0xFF009FA8)
        : const Color(0xFF00B7C2);

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Center(
        child: CustomText(
          text: "Day\n${day.dayNumber}",
          textAlign: TextAlign.center,
          fontColor: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}