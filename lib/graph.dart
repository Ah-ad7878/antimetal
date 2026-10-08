import 'dart:math';

import 'package:flutter/material.dart';

class Graph extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //calculate all value here
    final Size(:width, :height) = size;
    final center = Offset(width * 0.5, height * 0.5);

    //create paint here
    final linePaint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 0.9;

    //create nodes here
    final nodes = [
      _Node(0.1, 140, 10, Colors.black),
      _Node(0.3, 110, 14, const Color(0xFFFF9800)),
      _Node(0.6, 170, 7, Colors.black),
      _Node(0.9, 130, 12, const Color(0xFFD4A300)),
      _Node(1.2, 190, 8, Colors.black),
      _Node(1.5, 90, 16, const Color(0xFFFF5722)),
      _Node(1.8, 160, 6, Colors.black),
      _Node(2.1, 210, 11, const Color(0xFF9E9D24)),
      _Node(2.4, 150, 9, Colors.black),
      _Node(2.7, 180, 13, const Color(0xFFFF9800)),
      _Node(3.1, 120, 7, Colors.black),
      _Node(3.4, 200, 15, const Color(0xFFD4A300)),
      _Node(3.8, 100, 6, Colors.black),
      _Node(4.1, 160, 10, const Color(0xFFFF5722)),
      _Node(4.5, 140, 8, Colors.black),
      _Node(4.9, 180, 12, const Color(0xFF9E9D24)),
      _Node(5.2, 130, 9, Colors.black),
      _Node(5.6, 170, 14, const Color(0xFFFF9800)),
      _Node(5.9, 110, 5, Colors.black),

      // Fixed 360-degree circle values (0 to 6.28 Radians)
      _Node(0.25, 165, 10, Colors.black),
      _Node(0.75, 175, 11, const Color(0xFFFF5722)),
      _Node(1.35, 140, 8, Colors.black),
      _Node(2.25, 215, 12, const Color(0xFF9E9D24)),
      _Node(3.65, 220, 9, Colors.black),
      _Node(4.35, 225, 14, const Color(0xFFFF9800)),
      _Node(5.45, 230, 13, Colors.black),
    ];

    for (var node in nodes) {
      final dx = center.dx + node.radius * cos(node.angle);
      final dy = center.dy + node.radius * sin(node.angle);
      final nodePos = Offset(dx, dy);

      canvas.drawLine(center, nodePos, linePaint);

      final nodePaint = Paint()..color = node.colors;
      canvas.drawCircle(nodePos, node.size / 2, nodePaint);
    }
  }

  @override
  bool shouldRepaint(Graph oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Graph oldDelegate) => false;
}

class _Node {
  final double angle;
  final double radius;
  final double size;
  final Color colors;

  _Node(this.angle, this.radius, this.size, this.colors);
}
