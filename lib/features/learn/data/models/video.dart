import 'package:youtube_player_flutter/youtube_player_flutter.dart';

enum VideoFilter {
  all('All'),
  solarSystem('Solar System'),
  starsGalaxies('Stars & Galaxies'),
  planets('Planets');

  const VideoFilter(this.label);
  final String label;

  static VideoFilter fromDbValue(String? value) {
    switch (value) {
      case 'solar_system':
        return VideoFilter.solarSystem;
      case 'stars_galaxies':
        return VideoFilter.starsGalaxies;
      case 'planets':
        return VideoFilter.planets;
      case 'all':
      default:
        return VideoFilter.all;
    }
  }
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

  String get thumbnailUrl =>
      'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';

  String get formattedDuration {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(duration.inMinutes)}:${two(duration.inSeconds % 60)}';
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    final minutes = (map['duration_minutes'] as num?)?.toInt() ?? 0;
    final seconds = (map['duration_seconds'] as num?)?.toInt() ?? 0;
    final rawLevel = map['level']?.toString().trim();

    return Video(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      category: map['category']?.toString() ?? '',
      filter: VideoFilter.fromDbValue(map['filter']?.toString()),
      duration: Duration(minutes: minutes, seconds: seconds),
      youtubeUrl: map['youtube_url']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      level: (rawLevel == null || rawLevel.isEmpty) ? null : rawLevel,
      isFeatured: map['is_featured'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'filter': filter.name,
      'duration_minutes': duration.inMinutes,
      'duration_seconds': duration.inSeconds.remainder(60),
      'youtube_url': youtubeUrl,
      'description': description,
      'level': level,
      'is_featured': isFeatured,
    };
  }
}