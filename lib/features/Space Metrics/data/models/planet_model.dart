import 'package:flutter/material.dart';
import 'package:space_app/core/gen/assets.gen.dart';

class PlanetModel {
  final String name;
  final Image image;
  final String title;        
  final String about;    
  final String distanceFromSun;
  final String lengthOfDay;    
  final String orbitalPeriod;  
  final String radius;         
  final String mass;           
  final String gravity;       
  final String surfaceArea;  

  const PlanetModel({
    required this.name,
    required this.image,
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
    name: 'Mercury',
    image: Assets.imgs.mercury.image(),
    title: 'Mercury: The Swift Planet',
    about: 'Mercury is the closest planet to the Sun and the smallest in the Solar System. Because of its proximity to the Sun and lack of atmosphere, it experiences extreme temperature fluctuations.',
    distanceFromSun: '57,910,000',
    lengthOfDay: '1,407.6',
    orbitalPeriod: '0.24',
    radius: '2,439.7',
    mass: '3.301 × 10²³',
    gravity: '3.7',
    surfaceArea: '7.48 × 10⁷',
  ),
  PlanetModel(
    name: 'Venus',
    image: Assets.imgs.venus.image(),
    title: 'Venus: Earth\'s Toxic Twin',
    about: 'Venus is the second planet from the Sun and its hottest planet. Its thick, toxic atmosphere traps heat in a runaway greenhouse effect, making it scorching hot.',
    distanceFromSun: '108,200,000',
    lengthOfDay: '5,832.2',
    orbitalPeriod: '0.62',
    radius: '6,051.8',
    mass: '4.867 × 10²⁴',
    gravity: '8.87',
    surfaceArea: '4.60 × 10⁸',
  ),
  PlanetModel(
    name: 'Earth',
    image: Assets.imgs.earth.image(),
    title: 'Earth: Our Blue Marble',
    about: 'Earth is the only known planet in the universe that supports life. Its unique combination of factors, including liquid water, a breathable atmosphere, and a suitable distance from the Sun, has created the ideal conditions for the development of complex organisms. Earth\'s magnetic field protects it from harmful solar radiation, and its atmosphere helps to regulate temperature and weather patterns.',
    distanceFromSun: '149,598,026',
    lengthOfDay: '23.93',
    orbitalPeriod: '1',
    radius: '6371',
    mass: '5.972 × 10²⁴',
    gravity: '9.81',
    surfaceArea: '5.10 × 10⁸',
  ),
  PlanetModel(
    name: 'Mars',
    image: Assets.imgs.mars.image(),
    title: 'Mars: The Red Planet',
    about: 'Mars is the fourth planet from the Sun – a dusty, cold, desert world with a very thin atmosphere. There is strong evidence Mars was—billions of years ago— wetter and warmer, with a thicker atmosphere.',
    distanceFromSun: '227,940,000',
    lengthOfDay: '24.62',
    orbitalPeriod: '1.88',
    radius: '3,389.5',
    mass: '6.417 × 10²³',
    gravity: '3.72',
    surfaceArea: '1.45 × 10⁸',
  ),
  PlanetModel(
    name: 'Jupiter',
    image: Assets.imgs.jupiter.image(),
    title: 'Jupiter: The King of Planets',
    about: 'Jupiter is the largest planet in our solar system by far, more than twice as massive as all the other planets combined. Jupiter\'s iconic Great Red Spot is a giant storm bigger than Earth that has raged for hundreds of years.',
    distanceFromSun: '778,330,000',
    lengthOfDay: '9.93',
    orbitalPeriod: '11.86',
    radius: '69,911',
    mass: '1.898 × 10²⁷',
    gravity: '24.79',
    surfaceArea: '6.21 × 10¹⁰',
  ),
  PlanetModel(
    name: 'Saturn',
    image: Assets.imgs.saturn.image(),
    title: 'Saturn: The Ringed Jewel',
    about: 'Saturn is the sixth planet from the Sun and the second largest in the solar system. Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system.',
    distanceFromSun: '1,433,500,000',
    lengthOfDay: '10.7',
    orbitalPeriod: '29.46',
    radius: '58,232',
    mass: '5.683 × 10²⁶',
    gravity: '10.44',
    surfaceArea: '4.27 × 10¹⁰',
  ),
  PlanetModel(
    name: 'Uranus',
    image: Assets.imgs.uranus.image(),
    title: 'Uranus: The Tilted Planet',
    about: 'Uranus is the seventh planet from its iconic blue-green appearance. Its unique tilt makes it spin on its side, resulting in extreme 42-year-long seasons.',
    distanceFromSun: '2,872,500,000',
    lengthOfDay: '17.24',
    orbitalPeriod: '84.01',
    radius: '25,362',
    mass: '8.681 × 10²⁵',
    gravity: '8.69',
    surfaceArea: '8.11 × 10⁹',
  ),
  PlanetModel(
    name: 'Neptune',
    image: Assets.imgs.neptune.image(),
    title: 'Neptune: The Windiest Planet',
    about: 'Neptune, the eighth and most distant major planet in our solar system, is a dark, cold, and whipped by supersonic winds. It was the first planet located through mathematical calculations rather than via a telescope.',
    distanceFromSun: '4,495,100,000',
    lengthOfDay: '16.11',
    orbitalPeriod: '164.8',
    radius: '24,622',
    mass: '1.024 × 10²⁶',
    gravity: '11.15',
    surfaceArea: '7.62 × 10⁹',
  ),
  PlanetModel(
    name: 'Sun',
    image: Assets.imgs.sun.image(),
    title: 'The Sun: Our Solar System\'s Star',
    about: 'The Sun is a yellow dwarf star, a hot ball of glowing plasma at the heart of our solar system. Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest debris in its orbit.',
    distanceFromSun: '0',
    lengthOfDay: '609.12',
    orbitalPeriod: '230,000,000',
    radius: '696,340',
    mass: '1.989 × 10³⁰',
    gravity: '274',
    surfaceArea: '6.09 × 10¹²',
  ),
];