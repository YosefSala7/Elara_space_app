import 'package:space_app/features/learn/data/models/video.dart';

/// Replace the 11-char placeholder IDs with real YouTube video IDs.
const List<VideoFilter> videoFilters = VideoFilter.values;

const List<Video> videos = [
  Video(
    id: '1',
    title: 'Avatar image SOLAR SYSTEM',
    category: 'Solar System',
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 4, seconds: 21),
    youtubeUrl: 'https://youtu.be/sD1-rS_TM2o?si=GEDSjyptU4eU-lI9',
    description:
        'Wanna know what is there in Space? What is the Milky Way? What are the various planets in our Solar System? Keep calm and watch this video where Dr.Binocs explains the Solar System in an interesting and detailed way!',
    isFeatured: true,
    level: "FOR KIDS",
  ),
  Video(
    id: '2',
    title: 'Solar System 101 | National Geographic',
    category: 'Solar System',
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 4, seconds: 10),
    youtubeUrl: 'https://youtu.be/libKVRa01L8?si=oTd-7R8JpXOoKrtr',
    description:
        'How many planets are in the solar system? How did it form in the Milky Way galaxy? Learn facts about the solar system’s genesis, plus its planets, moons, and asteroids.',
  ),
  Video(
    id: '3',
    title: 'Black Holes Explained – From Birth to Death',
    category: 'Black Holes',
    filter: VideoFilter.starsGalaxies,
    duration: Duration(minutes: 5, seconds: 56),
    youtubeUrl: 'https://youtu.be/e-P5IFTqB98?si=Yt_pajWQ6QU0bMtG',
    description: "Black holes. Lets talk about them",
  ),
  Video(
    id: '4',
    title:
        'Apollo Space Missions for Kids | Learn about Apollo 11, Apollo 13, and more!',
    category: 'Space Missions',
    filter: VideoFilter.solarSystem,
    duration: Duration(minutes: 5, seconds: 27),
    youtubeUrl: 'https://youtu.be/fObYUyyE4Ak?si=qhnSI6izlC4s-gL3',
    description:
        'The science, engineering, and human courage behind reaching Mars. This visual lesson turns complex science into a clear, memorable journey.',
    level: 'FOR KIDS',
  ),
  Video(
    id: '5',
    title: 'What If You Saw a Star Being Born?',
    category: 'Stars',
    filter: VideoFilter.starsGalaxies,
    duration: Duration(minutes: 9, seconds: 35),
    youtubeUrl: 'https://youtu.be/eZqyt2_aMXc?si=YVbQAZ4fN-1bsHib',
    description: 'Watch gas and dust collapse into a blazing stellar nursery.',
  ),
  Video(
    id: '6',
    title: 'Sun 101 | National Geographic',
    category: 'Sun',
    filter: VideoFilter.starsGalaxies,
    duration: Duration(minutes: 5, seconds: 00),
    youtubeUrl: 'https://youtu.be/2HoTK_Gqi2Q?si=SIxcS_yfuDvYvQ3B',
    description:
        'The sun keeps the planets in its orbit with a tremendous gravitational force. What would happen if it disappeared entirely? Learn about the star at the center of our solar system, and how it is critical to all life as we know it.',
  ),
];
