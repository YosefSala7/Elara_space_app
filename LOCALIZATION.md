# Localization (English / العربية)

The app follows the phone language automatically:
Arabic phone -> Arabic UI (RTL), anything else -> English.

## How it works
- `lib/l10n/app_localizations.dart` : delegate + `context.tr('English text')` helpers.
- `lib/l10n/strings_ar.dart`        : Arabic translations. The key is the original English text.
- `main.dart` only gets `localizationsDelegates` + `supportedLocales`.
- Models / data / cubits are untouched; texts are translated where they are displayed.
  Missing translation => the English text is shown (never crashes).

## Adding / changing a text
1. In the widget: `Text(context.tr('My new text'))`
   (with values: `context.trf('Best: {score}', {'score': 10})`).
2. Add `'My new text': 'النص بالعربي',` to `arStrings` in `strings_ar.dart`.

## Notes
- Only the texts written locally in the app are translated. Content coming from the API
  (Supabase planet name / about / stats values) is shown as-is.
- The bundled fonts (SpaceGrotesk / Audiowide) have no Arabic glyphs, so Android/iOS
  use the system Arabic font. Add an Arabic font (e.g. Cairo / Tajawal) if you want a custom look.
