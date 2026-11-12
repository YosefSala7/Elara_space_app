import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/features/learn/presenter/components/video.dart';

import 'video_thumbnail.dart';

class FeaturedVideoCard extends StatelessWidget {
  const FeaturedVideoCard({super.key, required this.video, required this.onTap});

  final Video video;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 220,
        child: VideoThumbnail(
          video: video,
          radius: 28,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('FEATURED',
                      style: t.labelSmall?.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w700)),
                ),
              ),
              Center(
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                      color: Colors.white30, shape: BoxShape.circle),
                  child: const Icon(Icons.play_arrow_rounded,
                      color: AppColors.white, size: 34),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'NEW LESSON • ${video.formattedDuration}',
                      style: t.labelSmall?.copyWith(color: AppColors.secorndary),
                    ),
                    const SizedBox(height: 6),
                    Text(video.title,
                        style: t.titleLarge?.copyWith(color: AppColors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
