import 'package:flutter/material.dart';

class TextAndGraph extends StatelessWidget {
  const TextAndGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: Image.asset('assets/images/graph.png')),
      ],
    );
  }
}
