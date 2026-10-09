import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ContinuousVideoSection extends StatefulWidget {
  const ContinuousVideoSection({super.key});

  @override
  State<ContinuousVideoSection> createState() => _ContinuousVideoSectionState();
}

class _ContinuousVideoSectionState extends State<ContinuousVideoSection> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/dashboard_demo.mp4')
          ..initialize().then((_) {
            setState(() {});
            _controller.setLooping(true);
            _controller.setVolume(0.0);
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF141517),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Container(
          width: 950,
          decoration: BoxDecoration(
            color: const Color(0xFF232428),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 40,
                spreadRadius: 2,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color(0xFF2B2C30),
                child: Row(
                  children: [
                    _dot(const Color(0xFFFF5F56)),
                    const SizedBox(width: 8),
                    _dot(const Color(0xFFFFBD2E)),
                    const SizedBox(width: 8),
                    _dot(const Color(0xFF27C93F)),
                  ],
                ),
              ),

              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const SizedBox(
                      height: 400,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white38),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
