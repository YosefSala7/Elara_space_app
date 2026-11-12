import 'package:youtube_player_flutter/youtube_player_flutter.dart';

enum VideoFilter {
  all('All'),
  solarSystem('Solar System'),
  starsGalaxies('Stars & Galaxies'),
  planets('Planets');

  const VideoFilter(this.label);
  final String label;
}

class Video {
  const Video({
    required this.id,
    required this.title,
    required this.category,
    required this.filter,
    required this.duration,
    required this.youtubeUrl,
    required this.description,
    this.level,
    this.isFeatured = false,
  });

  final String id;
  final String title;
  final String category; // display label, e.g. "Black Holes"
  final VideoFilter filter; // which chip it belongs to
  final Duration duration;
  final String youtubeUrl;
  final String description;
  final String? level; // e.g. "BEGINNER"
  final bool isFeatured;

  String? get youtubeId => YoutubePlayerController.convertUrlToId(youtubeUrl);

  String get thumbnailUrl => 'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';

  String get formattedDuration {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(duration.inMinutes)}:${two(duration.inSeconds % 60)}';
  }
}
