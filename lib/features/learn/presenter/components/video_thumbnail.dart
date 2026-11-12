import 'package:flutter/material.dart';
import 'package:space_app/features/learn/presenter/components/video.dart';

class VideoThumbnail extends StatelessWidget {
  const VideoThumbnail({
    super.key,
    required this.video,
    this.radius = 20,
    this.child,
  });

  final Video video;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            video.thumbnailUrl,
            fit: BoxFit.cover,
            frameBuilder: (_, image, frame, sync) => AnimatedOpacity(
              opacity: frame == null && !sync ? 0 : 1,
              duration: const Duration(milliseconds: 400),
              child: image,
            ),
            errorBuilder: (_, __, ___) => const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0B1B3A), Color(0xFF3A1B4F)],
                ),
              ),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
