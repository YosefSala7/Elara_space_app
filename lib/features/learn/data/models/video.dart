import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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

List<Video> aR = [
  Video(
    id: "1",
    title: "سر قوة الثقوب السوداء",
    category: "الثقوب السوداء",
    filter: VideoFilter.starsGalaxies,
    duration: Duration(minutes: 22, seconds: 27),
    youtubeUrl: "https://youtu.be/ha4VhfCrsVg?si=9BmtzswnZ0XH41o3",
    description:
        "الثقوب السوداء رهيبين. من فينا ما يحبهم و يبي يتعلم عنهم؟ في هذا الفيديو بسولف عنهم و احاول اشرح سبب قوتهم الكبيرة..",
  ),
  Video(
    id: "2",
    title: "رحلة عبر الفضاء",
    category: "النظام الشمسي",
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 19, seconds: 57),
    youtubeUrl: "https://youtu.be/USVhVmZFQLU?si=nqc8haVElWkG21r5",
    description: """
في هذا الوثائقي ننطلق في رحلة مدهشة عبر أعماق الفضاء، نستكشف الكواكب، المجرات، النجوم، والثقوب السوداء.
من عطارد الصغير الأقرب للشمس، إلى نبتون البعيد الغامض، ثم نغوص في أسرار المجرات العملاقة وسحر الثقوب السوداء، لنشهد عظمة الخلق وروعة الكون.
وثائقي مخصص لمساعدتك على الاسترخاء، التأمل، وحتى النوم الهادئ، مع صور مذهلة وشرح مبسط يمزج بين العلم والإبداع.
""",
  ),
  Video(
    id: "3",
    title: "رحلة إلى الفضاء 🌌",
    category: "النظام الشمسي",
    level: "FOR KIDS",
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 4, seconds: 14),
    youtubeUrl: "https://youtu.be/bd1gkcdw-BQ?si=SA6naqbFCsOrfVcS",
    description: """
مغامرة فضائية مذهلة! انطلق مع حمودي وأصدقائه من الأرض إلى الفضاء، واكتشف أسرار الكون وتفاصيل أعظم رحلة شهدها الوجود
""",
  ),
  Video(
    id: "4",
    title: "حقائق مذهلة عن المجموعة الشمسية",
    category: "حقائق علمية",
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 10, seconds: 29),
    youtubeUrl: "https://youtu.be/8_TVVIxib0k?si=rkXWJ2XLnNDBSpNi",
    description: "",
  ),
  Video(
    id: "5",
    title: "ماذا لو رحل القمر؟",
    category: "Moons",
    filter: VideoFilter.planets,
    duration: Duration(minutes: 1, seconds: 39),
    youtubeUrl: "https://youtu.be/dL7m9nvWWWQ?si=GYkpDhd-maRzhWpk",
    description: """
لقد سئم قمر الأرض من الشعور بعدم القيمة، لذلك قرر المغادرة إلى الأبد، لكن ما هي تأثيرات ذلك على أبناء الأرض؟
مرحبًا بك في سولار بولز بالعربي ،،  قناة كرات الفضاء المليئة بالمرح والرسوم المتحركة المسلية ، والتي تساعدك أيضًا على التعرف على النظام الشمسي والكون. 
إذا كنت تحب الرسوم المتحركة والكوميديا الفضائية - فأنت في المكان الصحيح يا صديقي!""",
  ),
];
