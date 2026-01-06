import 'package:flutter/material.dart';
import 'package:machine_test_2026/data/models/streak_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildStreakPath(List<StreakDay> days) {
    return ListView.builder(
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        final isCompleted = day.isCompleted;
        final isCurrent = day.isCurrent;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                // Top connector
                Container(
                  height: 30,
                  width: 2,
                  color: index == 0 ? Colors.transparent : Colors.grey.shade300,
                ),

                // Circle for day
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? Colors.green
                        : isCurrent
                            ? Colors.orange
                            : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: CustomText(
                      text: "${day.dayNumber}",
                      fontColor: isCompleted || isCurrent
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ),

                // Bottom connector
                Container(
                  height: 30,
                  width: 2,
                  color: index == days.length - 1
                      ? Colors.transparent
                      : Colors.grey.shade300,
                ),
              ],
            ),

            const SizedBox(width: 20),

            // Label for day
            CustomText(
              text: day.label, 
              fontSize: 16,
              fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
            ),

            if (isCompleted)
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.check, size: 16, color: Colors.green),
              ),
          ],
        );
      },
    );
  }