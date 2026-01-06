import 'package:flutter/material.dart';
import 'package:machine_test_2026/data/models/streak_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

class TopicCard extends StatelessWidget {
  final StreakDay day;

  const TopicCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF009FA8),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: day.topic.title,
            fontColor: Colors.white70,
            fontSize: 12,
          ),
          const SizedBox(height: 6),

          ...day.topic.modules.map(
            (m) => Padding(
              padding: const EdgeInsets.only(top: 4),
              child: CustomText(
                text: m.name,
                fontColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}