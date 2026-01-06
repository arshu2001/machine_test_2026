import 'package:flutter/material.dart';

class StreakPathPainter extends CustomPainter {
  final int count;

  StreakPathPainter(this.count);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    List<Offset> points = [];
    for (int i = 0; i < count; i++) {
        points.add(_getPoint(i, count));
    }
    
    if (points.isNotEmpty) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 0; i < points.length - 1; i++) {
        final p1 = points[i];
        final p2 = points[i+1];
        var control1 = Offset(p1.dx, (p1.dy + p2.dy) / 2);
        var control2 = Offset(p2.dx, (p1.dy + p2.dy) / 2);
        
        path.cubicTo(control1.dx, control1.dy, control2.dx, control2.dy, p2.dx, p2.dy);
      }
    }

    _drawDashed(canvas, path, paint);
  }

 
  Offset _getPoint(int index, int totalDays) {
     const double startY = 100; // Same as in widget
     const double gap = 130;    // Same as in widget
     
     final int visualIndex = totalDays - 1 - index; // 0=Top, 7=Bottom
     final bool isLeft = visualIndex % 2 == 0; 
     final double x = isLeft ? 60.0 : 230.0;
     final double y = startY + visualIndex * gap;
     
     return Offset(x, y);
  }

  void _drawDashed(Canvas canvas, Path path, Paint paint) {
    const double dashWidth = 10.0;
    const double dashSpace = 8.0;

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}