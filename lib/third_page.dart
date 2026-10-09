import 'package:antimetal/DashBord_cutomPainter.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
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

  Widget _dashBoard({required Widget child, double? height}) {
    return CustomPaint(
      painter: DashbordCutompainter(),
      child: Container(
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.03),
          border: Border.all(color: Colors.black38, width: 0.8),
        ),
        child: child,
      ),
    );
  }

  Widget _textBox(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1C1C1C),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  static Widget _iconBox(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      child: Icon(icon, size: 30, color: Colors.black87),
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
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _container(
                'THE AUTONOMOUS LAYER',
                'Everyone else watches. \n We operate.',
                'Most software stops at recommendations and assistance, keeping humans in the loop as the operational layer. Antimetal is designed to continuously investigate, operate, and improve production systems itself.',
              ),

              SizedBox(width: 40),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    _dashBoard(
                      child: _textBox(
                        'Yours Team',
                        'Defines priorities, direction, and goals.',
                      ),
                    ),

                    SizedBox(height: 12),
                    _dashBoard(
                      child: _textBox(
                        'Antimetal Agents',
                        'Army of specialists that act on production.',
                      ),
                    ),

                    SizedBox(height: 12),
                    _dashBoard(
                      child: _textBox(
                        'Antimetal World Model',
                        'A live view of how your stack actually behaves.',
                      ),
                    ),

                    SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _iconBox(Icons.widgets_outlined),
                          _iconBox(Icons.settings_input_component),
                          _iconBox(Icons.code),
                          _iconBox(Icons.insert_chart_outlined),
                          _iconBox(Icons.cloud_queue),
                          _iconBox(Icons.blur_on),
                          _iconBox(Icons.cloud_done),
                          _iconBox(Icons.polymer),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                            ),
                            child: const Text(
                              '+ 92 more',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),
                    _dashBoard(
                      child: _textBox(
                        'Production',
                        'Runtime systems, infrastructure, code execution, and everything around them.',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
