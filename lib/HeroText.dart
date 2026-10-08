import 'package:antimetal/DashBord_cutomPainter.dart';
import 'package:flutter/material.dart';

class HeroTextSection extends StatefulWidget {
  const HeroTextSection({super.key});

  @override
  State<HeroTextSection> createState() => _HeroTextSectionState();
}

class _HeroTextSectionState extends State<HeroTextSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0),
      end: Offset.zero,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideTransition(
          position: _animation,
          child: Text(
            'Production that runs itself.',
            style: TextStyle(
              color: Color(0xFF1C1C1C),
              fontSize: 52,
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -1,
            ),
          ),
        ),

        SizedBox(height: 24),
        SlideTransition(
          position: _animation,
          child: Text(
            'Antimetal is the autonomous system for production.\nContinuously understanding, operating, and improving\nyour environment',
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.65),
              fontSize: 18,
              height: 1.5,
            ),
          ),
        ),

        SizedBox(height: 40),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.grey.shade600,
                    duration: Duration(milliseconds: 300),
                    content: Text(
                      'Demo Booked Scussfully',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(25),
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
              ),
              child: Text('Book a Demo', style: TextStyle(fontSize: 14)),
            ),

            SizedBox(width: 16),
            CustomPaint(
              painter: DashbordCutompainter(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Text(
                  'Explore the research',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
