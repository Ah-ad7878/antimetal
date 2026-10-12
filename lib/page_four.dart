import 'package:antimetal/DashBord_cutomPainter.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'One platform. \nAn army of agents.',
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 42,
                fontWeight: .bold,
                letterSpacing: -1,
                height: 1.1,
                fontFamily: 'Serif',
              ),
            ),

            SizedBox(width: 40),
            Text(
              'Specialized agents that own different slices of production.\nComposable, customizable, and fully auditable.',
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 20,
                height: 1.4,
                color: Color(0xFF2C2C2C),
              ),
            ),
          ],
        ),

        SizedBox(height: 25),

        _box(
          'Proactive',
          'Patrol',
          'Continuously watches for operational risks, regressions, and system drift.',
        ),

        SizedBox(height: 12),
        _box(
          'Reactive',
          'Triage',
          'Turns noisy production signals into structured, actionable issues.',
        ),

        SizedBox(height: 12),
        _box(
          'Intelligence',
          'World Model',
          'Continuously learns how your systems and teams behave and evolve.',
        ),

        SizedBox(height: 12),
        _box(
          'Platform',
          'Agent Builder',
          'Create custom operational agents via natural language.',
        ),
      ],
    );
  }

  Widget _box(String title, String subtitle, String des) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        _isOn = true;
      }),
      onExit: (event) => setState(() {
        _isOn = false;
      }),
      child: CustomPaint(
        painter: DashbordCutompainter(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _isOn ? const Color(0xFF191817) : const Color(0xFFDCDDD5),
            border: Border.all(color: Colors.black38, width: 0.8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: _isOn ? Colors.white : const Color(0xFF70716A),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                subtitle,
                style: TextStyle(
                  color: _isOn ? Colors.white : const Color(0xFF70716A),
                  fontSize: 32,
                  height: 1.15,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                des,
                style: TextStyle(
                  color: _isOn ? Colors.white : const Color(0xFF70716A),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
