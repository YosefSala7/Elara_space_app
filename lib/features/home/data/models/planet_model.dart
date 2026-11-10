import 'package:flutter/widgets.dart';
import 'package:space_app/core/gen/assets.gen.dart';

class PlanetModel {
  final Image img;
  final String name;
  final String title;
  final String about;
  final String distanceFromSun;
  final String lengthOfDay;
  final String orbitalPeriod;
  final String radius;
  final String mass;
  final String gravity;
  final String surfaceArea;

  PlanetModel({
    required this.img,
    required this.name,
    required this.title,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });
}



List<PlanetModel> planets = [
    PlanetModel(
      img: Assets.imgs.earth.image(fit: BoxFit.cover),
      name: "Earth",
      title: "Earth: Our Blue Marble",
      about: "Earth is the only known planet in the universe that supports life. Its unique combination of factors, including liquid water, a breathable atmosphere, and a suitable distance from the Sun, has created the ideal conditions for the development of complex organisms. Earth's magnetic field protects it from harmful solar radiation, and its atmosphere helps to regulate temperature and weather patterns.",
      distanceFromSun: "149,598,026",
      lengthOfDay: "23.93",
      orbitalPeriod: "1",
      radius: "6,371",
      mass: "5.972 × 10²⁴",
      gravity: "9.81",
      surfaceArea: "5.10 × 10⁸",
    ),
    PlanetModel(
      img: Assets.imgs.jupiter.image(fit: BoxFit.cover),
      name: "Jupiter",
      title: "Jupiter: The King of Planets",
      about: "Jupiter is the largest planet in our solar system, more than twice as massive as all the other planets combined. Jupiter's iconic Great Red Spot is a giant storm bigger than Earth that has raged for hundreds of years. It has a faint ring system and dozens of moons, including Europa, which may harbor an underground ocean.",
      distanceFromSun: "778,547,200",
      lengthOfDay: "9.93",
      orbitalPeriod: "11.86",
      radius: "69,911",
      mass: "1.898 × 10²⁷",
      gravity: "24.79",
      surfaceArea: "6.14 × 10¹⁰",
    ),
    PlanetModel(
      img: Assets.imgs.mars.image(),
      name: "Mars",
      title: "Mars: The Red Planet",
      about: "Mars is the fourth planet from the Sun – a dusty, cold, desert world with a very thin atmosphere. There is strong evidence Mars was—billions of years ago— wetter and warmer, with a thicker atmosphere. Iron oxide prevalent on its surface gives it its reddish color.",
      distanceFromSun: "227,943,824",
      lengthOfDay: "24.62",
      orbitalPeriod: "1.88",
      radius: "3,389.5",
      mass: "6.417 × 10²³",
      gravity: "3.72",
      surfaceArea: "1.45 × 10⁷",
    ),
    PlanetModel(
      img: Assets.imgs.mercury.image(),
      name: "Mercury",
      title: "Mercury: The Swift Planet",
      about: "Mercury is the smallest planet in the solar system and closest to the Sun. Its-surface experiences extreme temperature fluctuations, ranging from scorching heat during the day to freezing cold at night. It has a heavily cratered surface resembling Earth's Moon.",
      distanceFromSun: "57,909,227",
      lengthOfDay: "1,407.6",
      orbitalPeriod: "0.24",
      radius: "2,439.7",
      mass: "3.301 × 10²³",
      gravity: "3.7",
      surfaceArea: "7.48 × 10⁷",
    ),
    PlanetModel(
      img: Assets.imgs.neptune.image(),
      name: "Neptune",
      title: "Neptune: The Windiest Planet",
      about: "Neptune, dark, cold, and whipped by supersonic winds, is the farthest major planet in our solar system. More than 30 times as far from the Sun as Earth, Neptune is mostly a thick, slushy fluid of water, ammonia, and methane over a heavier, approximately earth-sized solid core.",
      distanceFromSun: "4,495,060,000",
      lengthOfDay: "16.11",
      orbitalPeriod: "164.8",
      radius: "24,622",
      mass: "1.024 × 10²⁶",
      gravity: "11.15",
      surfaceArea: "7.61 × 10⁹",
    ),
    PlanetModel(
      img: Assets.imgs.saturn.image(fit: BoxFit.fitHeight),
      name: "Saturn",
      title: "Saturn: The Ringed Jewel",
      about: "Saturn is the sixth planet from the Sun and the second largest in the solar system. Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system. The other giant planets have rings, but none are as spectacular as Saturn's.",
      distanceFromSun: "1,433,535,389",
      lengthOfDay: "10.7",
      orbitalPeriod: "29.45",
      radius: "58,232",
      mass: "5.683 × 10²⁶",
      gravity: "10.44",
      surfaceArea: "4.27 × 10¹⁰",
    ),
    PlanetModel(
      img: Assets.imgs.sun.image(),
      name: "Sun",
      title: "The Sun: Heart of Our Solar System",
      about: "The Sun is a yellow dwarf star, a hot ball of glowing plasma at the heart of our solar system. Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest debris in its orbit. Its energy supports life on Earth through photosynthesis.",
      distanceFromSun: "0",
      lengthOfDay: "609.12",
      orbitalPeriod: "0",
      radius: "696,340",
      mass: "1.989 × 10³⁰",
      gravity: "274.0",
      surfaceArea: "6.09 × 10¹²",
    ),
    PlanetModel(
      img: Assets.imgs.uranus.image(),
      name: "Uranus",
      title: "Uranus: The Tilted Planet",
      about: "Uranus rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin on its side, giving it extreme 21-year-long seasons. It is an ice giant with a blue-green color caused by atmospheric methane.",
      distanceFromSun: "2,870,972,000",
      lengthOfDay: "17.24",
      orbitalPeriod: "84.0",
      radius: "25,362",
      mass: "8.681 × 10²⁵",
      gravity: "8.69",
      surfaceArea: "8.11 × 10⁹",
    ),
    PlanetModel(
      img: Assets.imgs.venus.image(),
      name: "Venus",
      title: "Venus: Earth's Toxic Twin",
      about: "Venus spins slowly in the opposite direction most planets do. Its thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system, with surface temperatures hot enough to melt lead.",
      distanceFromSun: "108,208,930",
      lengthOfDay: "5,832.5",
      orbitalPeriod: "0.62",
      radius: "6,051.8",
      mass: "4.867 × 10²⁴",
      gravity: "8.87",
      surfaceArea: "4.60 × 10⁸",
    ),
  ];