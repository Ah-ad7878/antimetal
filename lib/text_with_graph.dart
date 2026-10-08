import 'package:flutter/material.dart';

class TextAndGraph extends StatelessWidget {
  const TextAndGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final graph = Image.asset(
          'assets/images/graph.png',
          fit: BoxFit.contain,
        );
        final text = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12, top: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 1.0),
                  ),
                  child: const Text(
                    'P',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD35400),
                      fontFamily: 'Serif',
                      height: 1.0,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'roduction engineering, as practiced today, is breaking. Software systems have grown too complex for humans to manually operate, and the knowledge required to run them is fragmented across tools, infrastructure, alerts, and tribal knowledge. The result is pages at 3 a.m., dashboards that surface symptoms instead of causes, and fixes that never become prevention.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xFF222222),
                      fontFamily: 'Serif',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Antimetal is building the autonomous system for production: a new layer between your team and your running systems.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color(0xFF222222),
                fontFamily: 'Serif',
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'It diagnoses. It fixes. It prevents. It learns how your systems run and operates production for you.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color(0xFF222222),
                fontFamily: 'Serif',
              ),
            ),
          ],
        );

        if (constraints.maxWidth < 900) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 280, width: double.infinity, child: graph),
              const SizedBox(height: 24),
              text,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 6, child: graph),
            const SizedBox(width: 50),
            Expanded(flex: 5, child: text),
          ],
        );
      },
    );
  }
}
