import 'dart:math';

import 'package:antimetal/graph.dart';
import 'package:flutter/material.dart';

class GraphClass extends StatefulWidget {
  const GraphClass({super.key});

  @override
  State<GraphClass> createState() => _GraphClassState();
}

class _GraphClassState extends State<GraphClass>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: CustomPaint(painter: Graph()),
          );
        },
      ),
    );
  }
}
