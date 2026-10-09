import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Picpage extends StatefulWidget {
  const Picpage({super.key});

  @override
  State<Picpage> createState() => _PicpageState();
}

class _PicpageState extends State<Picpage> {
  late VideoPlayerController _videoPlayer;

  @override
  void initState() {
    super.initState();
    _videoPlayer = VideoPlayerController.asset('assets/video.graph.mp4')
      ..initialize().then((_) {
        setState(() {
          _videoPlayer.setLooping(true);
          _videoPlayer.setVolume(0.0);
          _videoPlayer.play();
        });
      });
  }

  @override
  void dispose() {
    _videoPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return _videoPlayer.value.isInitialized
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: _videoPlayer.value.aspectRatio,
              child: VideoPlayer(_videoPlayer), 
            ),
          )
        : const SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
          );
  }
}
