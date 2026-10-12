import 'package:antimetal/DashBord_cutomPainter.dart';
import 'package:flutter/material.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  Widget _cards(
    String imageUrl,
    String category,
    String date,
    String title,
    String description,
    String authorName,
    String readTime,
  ) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: const Color(0xFFDCDDD5),
        border: Border.all(color: const Color(0xFFBFBFC2), width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    color: Color(0xFF70716A),
                  ),
                ),

                const SizedBox(width: 16),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Color(0xFF70716A),
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1C1C1C),
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.45,
                    color: Color(0xFF5A5B54),
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      authorName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    const Spacer(),

                    Text(
                      readTime,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Color(0xFF5A5B54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'From the research log.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                height: 1.2,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(width: 40),
            CustomPaint(
              painter: DashbordCutompainter(),
              child: const SizedBox(
                height: 40,
                width: 100,
                child: Center(
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _cards(
              'assets/images/pic_one.png',
              'Research',
              '12/02/2022',
              'Compressing Production Telemetry for Agents',
              'How we fit 10 to 100x more telemetry into the same context window, and why that changes what agents can debug.',
              'Thibaud Roy',
              '6 min',
            ),

            SizedBox(width: 15),

            _cards(
              'assets/images/pic_two.png',
              'Research',
              '10/07/2026',
              'We used Antimetal to resolve 76% of our production errors in one day',
              'We pointed Antimetal at our production environment to see how many errors it could resolve on its own.',
              'Thibaud Roy',
              '9 min',
            ),

            SizedBox(width: 15),

            _cards(
              'assets/images/pic_three.png',
              'Engineering',
              '10/07/2026',
              'How we automated technical implementation',
              'Most startups scale onboarding by hiring forward-deployed engineers. We built Anvil to do most of it in software, before reaching for people.',
              'Sai Naidu',
              '7 min',
            ),
          ],
        ),
      ],
    );
  }
}
