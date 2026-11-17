import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/features/learn/data/repos/video_data.dart';
import 'package:space_app/features/learn/presenter/components/category_chips.dart';
import 'package:space_app/features/learn/presenter/components/featured_video_card.dart';
import 'package:space_app/features/learn/presenter/components/video.dart';
import 'package:space_app/features/learn/presenter/components/video_list_tile.dart';

import 'video_detail_screen.dart';

class SpaceAcademyScreen extends StatefulWidget {
  const SpaceAcademyScreen({super.key});
  static String routeName = "/learn";
  @override
  State<SpaceAcademyScreen> createState() => _SpaceAcademyScreenState();
}

class _SpaceAcademyScreenState extends State<SpaceAcademyScreen> {
  VideoFilter _filter = VideoFilter.all;

  Video get _featured => videos.firstWhere((v) => v.isFeatured);

  List<Video> get _filtered => videos
      .where((v) => !v.isFeatured)
      .where((v) => _filter == VideoFilter.all || v.filter == _filter)
      .toList();

  void _open(Video video) {
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => VideoDetailScreen(video: video),
      transitionsBuilder: (_, anim, __, child) =>
          FadeTransition(opacity: anim, child: child),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final items = _filtered;

    return Background(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 32),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('WATCH & DISCOVER',
                        style: t.labelSmall?.copyWith(color: AppColors.white)),
                    const SizedBox(height: 4),
                    Text('Space Academy',
                        style: t.displayMedium?.copyWith(color: AppColors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FeaturedVideoCard(
                    video: _featured, onTap: () => _open(_featured)),
              ),
              const SizedBox(height: 20),
              CategoryChips(
                filters: videoFilters,
                selected: _filter,
                onSelected: (f) => setState(() => _filter = f),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Continue learning',
                        style:
                            t.headlineSmall?.copyWith(color: AppColors.white)),
                    Text('lessons ${items.length}',
                        style: t.labelSmall
                            ?.copyWith(color: AppColors.secorndary)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                switchInCurve: Curves.easeOut,
                child: Column(
                  key: ValueKey(_filter),
                  children: [
                    for (final (i, v) in items.indexed)
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(milliseconds: 300 + i * 90),
                        curve: Curves.easeOutCubic,
                        builder: (_, value, child) => Opacity(
                          opacity: value,
                          child: Transform.translate(
                              offset: Offset(0, 24 * (1 - value)), child: child),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child:
                              VideoListTile(video: v, onTap: () => _open(v)),
                        ),
                      ),
                    if (items.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text('No lessons yet',
                            style: t.labelSmall
                                ?.copyWith(color: AppColors.secorndary)),
                      ),
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
