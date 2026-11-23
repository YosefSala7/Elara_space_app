
import 'package:space_app/features/quizes/data/models/quiz_category.dart';
import 'package:space_app/features/quizes/data/models/quiz_question.dart';

class QuizLocalDataSource {
  /// How many questions are played per session.
  static const int questionsPerQuiz = 5;

  static const _categories = <QuizCategory>[
    QuizCategory(
      id: 'solar_system',
      title: 'Solar System',
      description: 'The Sun, asteroids, comets and everything in orbit.',
      image: 'assets/images/quiz/solar_system.png',
      questionCount: questionsPerQuiz,
    ),
    QuizCategory(
      id: 'planets',
      title: 'Planets',
      description: 'Rings, storms and extreme worlds, one planet at a time.',
      image: 'assets/images/quiz/planets.png',
      questionCount: questionsPerQuiz,
    ),
    QuizCategory(
      id: 'moons',
      title: 'Moons',
      description: 'Icy oceans, volcanoes and the moons that orbit them.',
      image: 'assets/images/quiz/moons.png',
      questionCount: questionsPerQuiz,
    ),
    QuizCategory(
      id: 'stars_galaxies',
      title: 'Stars & Galaxies',
      description: 'Stellar giants, black holes and distant galaxies.',
      image: 'assets/images/quiz/stars_galaxies.png',
      questionCount: questionsPerQuiz,
    ),
    QuizCategory(
      id: 'exploration',
      title: 'Space Exploration',
      description: 'Rockets, rovers, probes and historic missions.',
      image: 'assets/images/quiz/exploration.png',
      questionCount: questionsPerQuiz,
    ),
  ];

  List<QuizCategory> getCategories() => List.of(_categories);

  /// Returns a fresh, mutable list of all questions for [categoryId].
  List<QuizQuestion> getQuestions(String categoryId) =>
      _questions.where((q) => q.categoryId == categoryId).toList();

  static const _questions = <QuizQuestion>[
    // ───────── Solar System ─────────
    QuizQuestion(
      id: 'ss_1',
      categoryId: 'solar_system',
      question: 'How many planets are in our solar system?',
      answers: ['6', '7', '8', '9'],
      correctAnswerIndex: 2,
      explanation: 'Eight planets orbit the Sun since Pluto was reclassified.',
    ),
    QuizQuestion(
      id: 'ss_2',
      categoryId: 'solar_system',
      question: 'What is the Sun mostly made of?',
      answers: ['Liquid lava', 'Hydrogen and helium', 'Iron and nickel', 'Oxygen'],
      correctAnswerIndex: 1,
      explanation: 'About 99% of the Sun is hydrogen and helium plasma.',
    ),
    QuizQuestion(
      id: 'ss_3',
      categoryId: 'solar_system',
      question: 'Which region lies between Mars and Jupiter?',
      answers: ['Kuiper Belt', 'Oort Cloud', 'Asteroid Belt', 'Van Allen Belt'],
      correctAnswerIndex: 2,
      explanation: 'The main asteroid belt sits between Mars and Jupiter.',
    ),
    QuizQuestion(
      id: 'ss_4',
      categoryId: 'solar_system',
      question: 'About how long does sunlight take to reach Earth?',
      answers: ['8 seconds', '8 minutes', '8 hours', '8 days'],
      correctAnswerIndex: 1,
      explanation: 'Light travels about 150 million km in roughly 8 minutes.',
    ),
    QuizQuestion(
      id: 'ss_5',
      categoryId: 'solar_system',
      question: 'Which world was reclassified as a dwarf planet in 2006?',
      answers: ['Ceres', 'Eris', 'Pluto', 'Haumea'],
      correctAnswerIndex: 2,
      explanation: 'The IAU redefined "planet" in 2006, and Pluto no longer fit.',
    ),
    QuizQuestion(
      id: 'ss_6',
      categoryId: 'solar_system',
      question: 'Which planet is closest to the Sun?',
      answers: ['Venus', 'Mercury', 'Mars', 'Earth'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      id: 'ss_7',
      categoryId: 'solar_system',
      question: "Roughly every how many years does Halley's Comet return?",
      answers: ['26', '76', '126', '176'],
      correctAnswerIndex: 1,
      explanation: "Halley's Comet returns about every 76 years. Next: 2061.",
    ),

    // ───────── Planets ─────────
    QuizQuestion(
      id: 'pl_1',
      categoryId: 'planets',
      question: 'Which planet has the largest storm in our solar system?',
      answers: ['Mars', 'Earth', 'Venus', 'Jupiter'],
      correctAnswerIndex: 3,
      image: 'assets/images/quiz/jupiter.png',
      explanation: "Jupiter's Great Red Spot is a storm wider than Earth.",
    ),
    QuizQuestion(
      id: 'pl_2',
      categoryId: 'planets',
      question: 'Which planet is known as the Red Planet?',
      answers: ['Mars', 'Mercury', 'Saturn', 'Neptune'],
      correctAnswerIndex: 0,
      image: 'assets/images/quiz/mars.png',
      explanation: 'Iron oxide (rust) on its surface gives Mars its red color.',
    ),
    QuizQuestion(
      id: 'pl_3',
      categoryId: 'planets',
      question: 'Which planet has the most prominent ring system?',
      answers: ['Uranus', 'Saturn', 'Neptune', 'Jupiter'],
      correctAnswerIndex: 1,
      image: 'assets/images/quiz/saturn.png',
    ),
    QuizQuestion(
      id: 'pl_4',
      categoryId: 'planets',
      question: 'Which planet is the hottest?',
      answers: ['Mercury', 'Venus', 'Mars', 'Jupiter'],
      correctAnswerIndex: 1,
      explanation:
          'Venus has a thick CO₂ atmosphere that traps heat, about 465°C.',
    ),
    QuizQuestion(
      id: 'pl_5',
      categoryId: 'planets',
      question: 'Which planet rotates on its side?',
      answers: ['Neptune', 'Uranus', 'Saturn', 'Venus'],
      correctAnswerIndex: 1,
      explanation: 'Uranus is tilted about 98°, so it rolls around the Sun.',
    ),
    QuizQuestion(
      id: 'pl_6',
      categoryId: 'planets',
      question: 'Which planet has the fastest winds in the solar system?',
      answers: ['Neptune', 'Saturn', 'Jupiter', 'Mars'],
      correctAnswerIndex: 0,
      explanation: 'Neptune winds can exceed 2,000 km/h.',
    ),
    QuizQuestion(
      id: 'pl_7',
      categoryId: 'planets',
      question: 'Which planet has a day longer than its year?',
      answers: ['Mercury', 'Venus', 'Mars', 'Earth'],
      correctAnswerIndex: 1,
      explanation: 'Venus spins so slowly that one rotation takes longer than '
          'one orbit around the Sun.',
    ),

    // ───────── Moons ─────────
    QuizQuestion(
      id: 'mo_1',
      categoryId: 'moons',
      question: 'How many natural moons does Earth have?',
      answers: ['0', '1', '2', '3'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      id: 'mo_2',
      categoryId: 'moons',
      question: 'What is the largest moon in the solar system?',
      answers: ['Titan', 'Ganymede', 'Europa', 'The Moon'],
      correctAnswerIndex: 1,
      explanation: 'Ganymede, a moon of Jupiter, is larger than Mercury.',
    ),
    QuizQuestion(
      id: 'mo_3',
      categoryId: 'moons',
      question: 'Which moon of Jupiter is the most volcanically active?',
      answers: ['Europa', 'Callisto', 'Io', 'Ganymede'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      id: 'mo_4',
      categoryId: 'moons',
      question: 'Which moon of Saturn has a thick atmosphere?',
      answers: ['Enceladus', 'Titan', 'Mimas', 'Rhea'],
      correctAnswerIndex: 1,
      explanation: 'Titan has a dense nitrogen atmosphere and methane lakes.',
    ),
    QuizQuestion(
      id: 'mo_5',
      categoryId: 'moons',
      question: 'Which moon likely hides a liquid ocean under its icy shell?',
      answers: ['Europa', 'Io', 'Phobos', 'Triton'],
      correctAnswerIndex: 0,
      explanation: "Europa's ocean makes it a top target in the search for life.",
    ),
    QuizQuestion(
      id: 'mo_6',
      categoryId: 'moons',
      question: 'What are the names of the two moons of Mars?',
      answers: [
        'Phobos and Deimos',
        'Titan and Rhea',
        'Io and Europa',
        'Triton and Nereid',
      ],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      id: 'mo_7',
      categoryId: 'moons',
      question: "What mainly causes Earth's ocean tides?",
      answers: [
        "The Sun's heat",
        "Earth's rotation alone",
        "The Moon's gravity",
        'Solar wind',
      ],
      correctAnswerIndex: 2,
    ),

    // ───────── Stars & Galaxies ─────────
    QuizQuestion(
      id: 'sg_1',
      categoryId: 'stars_galaxies',
      question: 'What is the name of our home galaxy?',
      answers: ['Andromeda', 'Milky Way', 'Triangulum', 'Whirlpool'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      id: 'sg_2',
      categoryId: 'stars_galaxies',
      question: 'Which star is closest to Earth after the Sun?',
      answers: ['Sirius', 'Betelgeuse', 'Proxima Centauri', 'Polaris'],
      correctAnswerIndex: 2,
      explanation: 'Proxima Centauri is about 4.24 light-years away.',
    ),
    QuizQuestion(
      id: 'sg_3',
      categoryId: 'stars_galaxies',
      question: "What happens to light that crosses a black hole's event horizon?",
      answers: [
        'It bounces back',
        'It cannot escape',
        'It speeds up',
        'It turns into matter',
      ],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      id: 'sg_4',
      categoryId: 'stars_galaxies',
      question: 'Which large galaxy is nearest to the Milky Way?',
      answers: ['Andromeda', 'Sombrero', 'Pinwheel', 'Whirlpool'],
      correctAnswerIndex: 0,
      explanation: 'Andromeda is about 2.5 million light-years away.',
    ),
    QuizQuestion(
      id: 'sg_5',
      categoryId: 'stars_galaxies',
      question: "Which is the brightest star in Earth's night sky?",
      answers: ['Polaris', 'Sirius', 'Vega', 'Rigel'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      id: 'sg_6',
      categoryId: 'stars_galaxies',
      question: 'What does a light-year measure?',
      answers: ['Time', 'Distance', 'Speed', 'Brightness'],
      correctAnswerIndex: 1,
      explanation: 'It is the distance light travels in one year, ~9.46 trillion km.',
    ),
    QuizQuestion(
      id: 'sg_7',
      categoryId: 'stars_galaxies',
      question: 'How is our Sun classified?',
      answers: ['Red giant', 'White dwarf', 'Yellow dwarf', 'Neutron star'],
      correctAnswerIndex: 2,
      explanation: 'The Sun is a G-type main-sequence star, a "yellow dwarf".',
    ),

    // ───────── Space Exploration ─────────
    QuizQuestion(
      id: 'ex_1',
      categoryId: 'exploration',
      question: 'Who was the first human to travel into space?',
      answers: ['Neil Armstrong', 'Yuri Gagarin', 'Alan Shepard', 'John Glenn'],
      correctAnswerIndex: 1,
      explanation: 'Yuri Gagarin orbited Earth on April 12, 1961.',
    ),
    QuizQuestion(
      id: 'ex_2',
      categoryId: 'exploration',
      question: 'What was the first artificial satellite?',
      answers: ['Explorer 1', 'Sputnik 1', 'Vostok 1', 'Telstar'],
      correctAnswerIndex: 1,
      explanation: 'The USSR launched Sputnik 1 in October 1957.',
    ),
    QuizQuestion(
      id: 'ex_3',
      categoryId: 'exploration',
      question: 'In which year did Apollo 11 land on the Moon?',
      answers: ['1961', '1965', '1969', '1972'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      id: 'ex_4',
      categoryId: 'exploration',
      question: 'Which rover carried the Ingenuity helicopter to Mars?',
      answers: ['Curiosity', 'Opportunity', 'Perseverance', 'Spirit'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      id: 'ex_5',
      categoryId: 'exploration',
      question: 'Which probe was the first to reach interstellar space?',
      answers: ['Pioneer 10', 'Voyager 1', 'New Horizons', 'Cassini'],
      correctAnswerIndex: 1,
      explanation: 'Voyager 1 crossed the heliopause in 2012.',
    ),
    QuizQuestion(
      id: 'ex_6',
      categoryId: 'exploration',
      question: 'Which space telescope launched in December 2021?',
      answers: ['Hubble', 'Kepler', 'James Webb', 'Spitzer'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      id: 'ex_7',
      categoryId: 'exploration',
      question: 'Which space station has been continuously crewed since 2000?',
      answers: ['Mir', 'Skylab', 'ISS', 'Tiangong'],
      correctAnswerIndex: 2,
    ),
  ];
}
