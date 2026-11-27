class SettingsData {
  final String title;
  final String content;
  final List<SocialLink> links;
  const SettingsData({
    required this.title,
    required this.content,
    required this.links,
  });
}

class SocialLink {
  final String name;
  final String url;

  const SocialLink({required this.name, required this.url});
}

const List<SettingsData> settingsData = [
  SettingsData(
    title: "Contact Us",
    content:
        "Have a question, feedback, or found a bug?\n"
        "We'd love to hear from you.\n\n",
    links: [
      SocialLink(
        name: "Mariam khaled",
        url:
            "https://www.linkedin.com/in/mariam-khaled-34640b334?utm_source=share_via&utm_content=profile&utm_medium=member_android",
      ),
      SocialLink(
        name: "Laila Alaa",
        url: "https://www.linkedin.com/in/laila-alaa-814114289",
      ),
      SocialLink(
        name: "Youssef Salah",
        url:
            "https://www.linkedin.com/in/youssef-salah-hussain?utm_source=share_via&utm_content=profile&utm_medium=member_android",
      ),
    ],
  ),
  SettingsData(
    title: "About Us",
    content:
        "Elara is an app that lets you explore the planets of our solar system "
        "in a fun and interactive way.\n\n"
        "• Discover your weight and age on every planet.\n"
        "• View the planets in 3D.\n"
        "• Watch educational videos.\n"
        "• Test your knowledge with quizzes.\n\n"
        "Our goal is to make space learning simple and exciting for everyone.",
    links: [],
  ),
  SettingsData(
    title: "Privacy Policy",
    content:
        "Your privacy matters to us.\n\n"
        "• The weight and age you enter are used only to calculate your "
        "results on each planet.\n"
        "• We do not sell or share your personal information.\n"
        "• The app uses third-party services (such as Supabase for app data "
        "and YouTube for videos), which may have their own privacy policies.\n\n"
        "By using Elara, you agree to this policy. For any questions, "
        "contact us at elaraspace@gmail.com.",
    links: [],
  ),
  SettingsData(
    title: "Terms & Conditions",
    content:
        "By using Elara, you agree to the following:\n\n"
        "• The app is for educational and entertainment purposes only.\n"
        "• Planet calculations are approximate and not for scientific use.\n"
        "• Do not misuse the app or try to disrupt its services.\n"
        "• We may update the app and these terms at any time.\n\n"
        "If you do not agree, please stop using the app.",
    links: [],
  ),
];
