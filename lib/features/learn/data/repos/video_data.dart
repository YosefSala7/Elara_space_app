import 'package:space_app/features/learn/presenter/components/video.dart';


/// Replace the 11-char placeholder IDs with real YouTube video IDs.
const List<VideoFilter> videoFilters = VideoFilter.values;

const List<Video> videos = [
  Video(
    id: '1',
    title: 'A Tour of Our Solar System',
    category: 'Solar System',
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 8, seconds: 42),
    youtubeUrl: 'https://www.youtube.com/watch?v=REPLACE_001',
    description: 'A guided journey across the Sun, planets, moons and beyond.',
    isFeatured: true,
  ),
  Video(
    id: '2',
    title: 'Solar System',
    category: 'Planets',
    filter: VideoFilter.planets,
    duration: Duration(minutes: 10, seconds: 18),
    youtubeUrl: 'https://www.youtube.com/watch?v=REPLACE_002',
    description:
        'Explore the wonders of our solar system, where planets, moons, and cosmic mysteries await beyond the stars.',
  ),
  Video(
    id: '3',
    title: 'How Black Holes Bend Time',
    category: 'Black Holes',
    filter: VideoFilter.starsGalaxies,
    duration: Duration(minutes: 12, seconds: 18),
    youtubeUrl: 'https://www.youtube.com/watch?v=REPLACE_003',
    description:
        "Follow light to the edge of the universe's most mysterious objects.",
  ),
  Video(
    id: '4',
    title: 'Living on the Red Planet',
    category: 'Space Missions',
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 6, seconds: 55),
    youtubeUrl: 'https://www.youtube.com/watch?v=REPLACE_004',
    description:
        'The science, engineering, and human courage behind reaching Mars. This visual lesson turns complex science into a clear, memorable journey.',
    level: 'BEGINNER',
  ),
  Video(
    id: '5',
    title: 'Birth of a Star',
    category: 'Stars',
    filter: VideoFilter.starsGalaxies,
    duration: Duration(minutes: 9, seconds: 5),
    youtubeUrl: 'https://www.youtube.com/watch?v=REPLACE_005',
    description: 'Watch gas and dust collapse into a blazing stellar nursery.',
  ),
  Video(
    id: '6',
    title: 'Giants of the Outer Planets',
    category: 'Planets',
    filter: VideoFilter.planets,
    duration: Duration(minutes: 7, seconds: 30),
    youtubeUrl: 'https://www.youtube.com/watch?v=REPLACE_006',
    description: 'Jupiter, Saturn, Uranus and Neptune: storms, rings and ice.',
    level: 'INTERMEDIATE',
  ),
];
