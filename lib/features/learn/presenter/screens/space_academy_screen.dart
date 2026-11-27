import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';

import 'package:space_app/features/learn/data/models/video.dart';
import 'package:space_app/features/learn/data/repos/video_data.dart';

import 'package:space_app/features/learn/presenter/components/category_chips.dart';
import 'package:space_app/features/learn/presenter/components/featured_video_card.dart';
import 'package:space_app/features/learn/presenter/components/video_list_tile.dart';

import 'package:space_app/features/learn/presenter/manager/videos_cubit.dart';
import 'package:space_app/features/learn/presenter/manager/videos_state.dart';

import 'video_detail_screen.dart';

class SpaceAcademyScreen extends StatefulWidget {
  const SpaceAcademyScreen({super.key});

  static String routeName = "/learn";

  @override
  State<SpaceAcademyScreen> createState() => _SpaceAcademyScreenState();
}

class _SpaceAcademyScreenState extends State<SpaceAcademyScreen> {
  VideoFilter _filter = VideoFilter.all;

  // Fake videos for Skeletonizer
  List<Video> get _skeletonVideos => [
        Video(
          id: '1',
          title: 'Exploring the Solar System',
          category: 'Solar System',
          filter: _filter,
          duration: const Duration(minutes: 12),
          youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          description: 'Exploring space and planets',
          isFeatured: true,
        ),
        Video(
          id: '2',
          title: 'Understanding Black Holes',
          category: 'Black Holes',
          filter: _filter,
          duration: const Duration(minutes: 8),
          youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          description: 'Learn about black holes',
        ),
        Video(
          id: '3',
          title: 'The Secrets of Galaxies',
          category: 'Galaxies',
          filter: _filter,
          duration: const Duration(minutes: 10),
          youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          description: 'Discover galaxies',
        ),
        Video(
          id: '4',
          title: 'Journey Through the Planets',
          category: 'Planets',
          filter: _filter,
          duration: const Duration(minutes: 15),
          youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          description: 'A journey through planets',
        ),
      ];

  void _open(Video video) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) => VideoDetailScreen(video: video),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  String _getErrorMessage(String error) {
    final message = error.toLowerCase();

    if (message.contains('socketexception') ||
        message.contains('failed host lookup') ||
        message.contains('network') ||
        message.contains('connection') ||
        message.contains('timeout') ||
        message.contains('clientexception')) {
      return 'مفيش اتصال بالإنترنت حالياً.\nاتأكد من اتصالك بالإنترنت وحاول تاني.';
    }

    if (message.contains('postgrest') ||
        message.contains('500') ||
        message.contains('502') ||
        message.contains('503') ||
        message.contains('504') ||
        message.contains('server')) {
      return 'في مشكلة في السيرفر حالياً.\nحاول تاني بعد شوية.';
    }

    return 'حصلت مشكلة أثناء تحميل الفيديوهات.\nمن فضلك حاول تاني.';
  }

  Widget _buildError(String error, TextTheme t) {
    final message = _getErrorMessage(error);

    final isNetworkError = message.contains('الإنترنت');

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isNetworkError ? Icons.wifi_off_rounded : Icons.cloud_off_rounded,
              size: 65,
              color: AppColors.secorndary,
            ),
            const SizedBox(height: 20),
            Text(
              isNetworkError ? 'Connection Problem' : 'Something Went Wrong',
              textAlign: TextAlign.center,
              style: t.titleLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: t.bodyMedium?.copyWith(
                color: AppColors.secorndary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                context.read<VideosCubit>().getVideos();
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secorndary,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(List<Video> videos, TextTheme t) {
    final featuredVideos = videos.where((v) => v.isFeatured).toList();

    final items = videos
        .where((v) => !v.isFeatured)
        .where(
          (v) => _filter == VideoFilter.all || v.filter == _filter,
        )
        .toList();

    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WATCH & DISCOVER',
                style: t.labelSmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Space Academy',
                style: t.displayMedium?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),

        if (featuredVideos.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FeaturedVideoCard(
              video: featuredVideos.first,
              onTap: () => _open(featuredVideos.first),
            ),
          ),

        const SizedBox(height: 20),

        CategoryChips(
          filters: videoFilters,
          selected: _filter,
          onSelected: (f) {
            setState(() {
              _filter = f;
            });
          },
        ),

        const SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Continue learning',
                style: t.headlineSmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                'lessons ${items.length}',
                style: t.labelSmall?.copyWith(
                  color: AppColors.secorndary,
                ),
              ),
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
                  duration: Duration(
                    milliseconds: 300 + i * 90,
                  ),
                  curve: Curves.easeOutCubic,
                  builder: (_, value, child) => Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 24 * (1 - value)),
                      child: child,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: VideoListTile(
                      video: v,
                      onTap: () => _open(v),
                    ),
                  ),
                ),

              if (items.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    'No lessons yet',
                    style: t.labelSmall?.copyWith(
                      color: AppColors.secorndary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Background(
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<VideosCubit, VideosState>(
            builder: (context, state) {
              if (!state.isLoading && state.error != null) {
                return _buildError(state.error!, t);
              }

              final videos = state.isLoading
                  ? _skeletonVideos
                  : state.videos;

              return Skeletonizer(
                enabled: state.isLoading,
                child: _buildContent(videos, t),
              );
            },
          ),
        ),
      ),
    );
  }
}
