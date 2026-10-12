import 'package:flutter/material.dart';

class SixPage extends StatelessWidget {
  const SixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 120.0, horizontal: 24),
      decoration: BoxDecoration(
        color: Color(0xFF0F1012),
        gradient: RadialGradient(
          center: Alignment(0.0, -0.2),
          radius: 1.2,
          colors: [Color(0xFF231B2A), Color(0xFF141A22), Color(0xFF0D0E10)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Serif',
                fontSize: 46,
                fontWeight: .w400,
                letterSpacing: -1.2,
                height: 1.1,
              ),
              children: [
                TextSpan(text: 'The autonomous system for production.'),
              ],
            ),
          ),

          SizedBox(height: 24),
          Text(
            'Take a 30 minute demo to see if Antimetal\nis the missing layer in your stack.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.w300,
              color: Color(0xFFB0B3B8),
            ),
          ),

          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: .min,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
                ),
                child: Text(
                  'Book a Demo',
                  style: TextStyle(fontSize: 14, fontWeight: .w300),
                ),
              ),

              SizedBox(width: 20),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.25),
                      width: 0.8,
                    ),
                  ),
                  child: const Text(
                    'Read the research',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
