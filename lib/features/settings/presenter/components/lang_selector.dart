import 'package:flutter/material.dart';
import 'lang_button.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LangButton(
          text: 'English',
          isSelected: selectedLanguage == 'English',
          onTap: () {
            setState(() {
              selectedLanguage = 'English';
            });
          },
        ),
        LangButton(
          text: 'Arabic',
          isSelected: selectedLanguage == 'Arabic',
          onTap: () {
            setState(() {
              selectedLanguage = 'Arabic';
            });
          },
        ),
      ],
    );
  }
}
