// import 'package:flutter/material.dart';
// import 'package:space_app/core/app_colors.dart';
// import 'package:space_app/core/components/background.dart';
// import 'package:space_app/features/learn/presenter/components/video.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoDetailScreen extends StatefulWidget {
//   const VideoDetailScreen({super.key, required this.video});
//   final Video video;

//   @override
//   State<VideoDetailScreen> createState() => _VideoDetailScreenState();
// }

// class _VideoDetailScreenState extends State<VideoDetailScreen> {
//   late final YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.video.youtubeId ?? '',
//       flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context).textTheme;
//     final v = widget.video;

//     return YoutubePlayerBuilder(
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: AppColors.primary,
//         progressColors: const ProgressBarColors(
//           playedColor: AppColors.primary,
//           handleColor: AppColors.primary,
//         ),
//       ),
//       builder: (context, player) => Background(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             leading: const BackButton(color: AppColors.white),
//           ),
//           body: SafeArea(
//             child: ListView(
//               padding: const EdgeInsets.all(20),
//               children: [
//                 ClipRRect(
//                     borderRadius: BorderRadius.circular(20), child: player),
//                 const SizedBox(height: 20),
//                 Row(children: [
//                   Text(v.category.toUpperCase(),
//                       style: t.labelSmall?.copyWith(color: AppColors.primary)),
//                   const SizedBox(width: 10),
//                   Text('• ${v.formattedDuration}',
//                       style:
//                           t.labelSmall?.copyWith(color: AppColors.secorndary)),
//                   if (v.level != null) ...[
//                     const SizedBox(width: 10),
//                     Text('• ${v.level}',
//                         style: t.labelSmall
//                             ?.copyWith(color: AppColors.secorndary)),
//                   ],
//                 ]),
//                 const SizedBox(height: 8),
//                 Text(v.title,
//                     style: t.titleLarge?.copyWith(color: AppColors.white)),
//                 const SizedBox(height: 12),
//                 Text(v.description,
//                     style: t.labelSmall
//                         ?.copyWith(color: AppColors.secorndary, height: 1.6)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/features/learn/presenter/components/video.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDetailScreen extends StatefulWidget {
  const VideoDetailScreen({super.key, required this.video});
  final Video video;

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.video.youtubeId ?? '',
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    debugPrint('YT id = ${widget.video.youtubeId}');

    _controller.listen((value) {
      if (value.hasError) debugPrint('YT error: ${value.error}');
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final v = widget.video;

    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      builder: (context, player) => Background(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const BackButton(color: AppColors.white),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: player,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      v.category.toUpperCase(),
                      style: t.labelSmall?.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '• ${v.formattedDuration}',
                      style: t.labelSmall?.copyWith(
                        color: AppColors.secorndary,
                      ),
                    ),
                    if (v.level != null) ...[
                      const SizedBox(width: 10),
                      Text(
                        '• ${v.level}',
                        style: t.labelSmall?.copyWith(
                          color: AppColors.secorndary,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  v.title,
                  style: t.titleLarge?.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  v.description,
                  style: t.labelSmall?.copyWith(
                    color: AppColors.secorndary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
