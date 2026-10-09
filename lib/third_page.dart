import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  final ScrollController scrollController;
  const ThirdPage({super.key, required this.scrollController});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    _updateAnimationOnScroll();
  }

  void _updateAnimationOnScroll() {
    if (!widget.scrollController.hasClients) return;

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    double startPoint = screenHeight * 0.85;
    double endPoint = screenHeight * 0.25;

    if (position.dy >= startPoint) {
      _controller.value = 0.0;
    } else if (position.dy <= endPoint) {
      _controller.value = 1.0;
    } else {
      double progress = (startPoint - position.dy) / (startPoint - endPoint);
      _controller.value = progress.clamp(0.0, 1.0);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  Widget _container(String title, String largeHeading, String desc) {
    return SlideTransition(
      position: _animation,
      child: Container(
        padding: const EdgeInsets.all(32.0),
        width: 500,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              largeHeading,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                height: 1.15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 6,
              child: Text(
                'A new layer of the stack',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(width: 40),
            const Expanded(
              flex: 5,
              child: Text(
                'Antimetal is the autonomous layer between your team and \nyour production systems.',
                style: TextStyle(
                  color: Color(0xFF2C2C2C),
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        _container(
          'THE VISION',
          'Production should \n run itself.',
          'Production is too complex to run manually. Engineers should set direction, ship product, and approve important changes. The rest should be handled autonomously.',
        ),
        const SizedBox(height: 25),
        _container(
          'THE WORLD MODEL',
          'A layer that owns \n the runtime.',
          'At its core sits a live world model, a continuous understanding of how your stack behaves. On top, an army of specialized agents acts on the model to diagnose, fix, prevent, and answer any question.',
        ),
        const SizedBox(height: 25),
        _container(
          'THE AUTONOMOUS LAYER',
          'Everyone else watches. \n We operate.',
          'Most software stops at recommendations and assistance, keeping humans in the loop as the operational layer. Antimetal is designed to continuously investigate, operate, and improve production systems itself.',
        ),
      ],
    );
  }
}
