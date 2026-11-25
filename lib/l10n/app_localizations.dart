import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'strings_ar.dart';

/// Lightweight localization layer.
///
/// The English text that already exists in the code is used as the lookup key,
/// so the original strings, models and logic stay exactly as they were:
///   * English device  -> the text is returned untouched.
///   * Arabic device   -> the text is looked up in [arStrings]; if there is no
///                        translation the original English text is shown.
class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// Delegates to pass to `MaterialApp.localizationsDelegates`.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  bool get isArabic => locale.languageCode == 'ar';

  /// Translates [text]. Falls back to [text] itself when nothing matches.
  String tr(String text) {
    if (!isArabic) return text;
    return arStrings[text] ?? text;
  }

  /// Translates a template such as `'Best: {score}'` and fills the `{name}`
  /// placeholders with [args].
  String trf(String template, Map<String, Object?> args) {
    var result = tr(template);
    args.forEach((key, value) {
      result = result.replaceAll('{$key}', '$value');
    });
    return result;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales.any(
        (l) => l.languageCode == locale.languageCode,
      );

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

/// `context.tr('Hello')` / `context.trf('Best: {score}', {'score': 5})`
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  String tr(String text) => AppLocalizations.of(this).tr(text);

  String trf(String template, Map<String, Object?> args) =>
      AppLocalizations.of(this).trf(template, args);

  /// Letter spacing that is safe for the current language. Arabic letters must
  /// stay connected, so any letter-spacing is dropped when the UI is Arabic.
  double ls(double spacing) => AppLocalizations.of(this).isArabic ? 0 : spacing;
}
