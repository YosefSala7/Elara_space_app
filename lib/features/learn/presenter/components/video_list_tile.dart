import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/features/learn/presenter/components/video.dart';

import 'video_thumbnail.dart';

class VideoListTile extends StatelessWidget {
  const VideoListTile({super.key, required this.video, required this.onTap});

  final Video video;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              height: 112,
              child: VideoThumbnail(
                video: video,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(video.formattedDuration,
                        style: t.labelSmall?.copyWith(color: AppColors.white)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(video.category,
                        style: t.labelSmall?.copyWith(color: AppColors.primary)),
                    if (video.level != null) ...[
                      const SizedBox(width: 8),
                      Text(video.level!,
                          style: t.labelSmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700)),
                    ],
                  ]),
                  const SizedBox(height: 4),
                  Text(video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: t.titleMedium?.copyWith(color: AppColors.white)),
                  const SizedBox(height: 6),
                  Text(video.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          t.labelSmall?.copyWith(color: AppColors.secorndary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
