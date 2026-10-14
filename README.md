# News App

A Flutter application that retrieves and displays news articles from the [GNews API](https://gnews.io/). The app provides a clean article feed, detailed news views, multilingual support, theme switching, and native splash screens.

## Features

- Loads up to 50 news articles from GNews
- Shows article images, sources, titles, descriptions, and publication dates
- Provides a dedicated details screen for each article
- Supports English and Khmer localization
- Supports light and dark themes
- Displays loading, empty, image-error, and API-error states
- Reports network request errors to the user when news cannot be loaded
- Includes native splash screens for Android and iOS

## Tech Stack

- [Flutter](https://flutter.dev/) and Dart
- [GetX](https://pub.dev/packages/get) for state management, routing, dependency injection, and localization
- [Dio](https://pub.dev/packages/dio) for HTTP requests
- [GetStorage](https://pub.dev/packages/get_storage) for lightweight local storage
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) for native splash screens

## API Configuration

The app currently uses this GNews configuration:

```text
Base URL: https://gnews.io
API key: 3d931f382d81e30644d6b405c634c455
```

The configuration is stored in `lib/app/config/app_config.dart`. The current request searches for `example`, requests English-language results for Cambodia (`kh`), and returns up to 50 articles.

## Getting Started

### Prerequisites

- Flutter SDK compatible with Dart `^3.10.0`
- Android Studio or Xcode
- A connected device, emulator, or simulator

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/sembunly/news_app.git
   cd news_app
   ```

2. Install the dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

## Useful Commands

```bash
# Analyze the project
flutter analyze

# Run tests
flutter test

# Regenerate native splash assets
dart run flutter_native_splash:create

# Install the Get CLI globally
dart pub global activate get_cli
```

## Project Structure

```text
lib/
├── main.dart
└── app/
    ├── config/               # Base URL and API key
    ├── data/providers/       # Dio API provider
    ├── modules/
    │   ├── home/             # News feed screen and controller
    │   └── news_details/     # Article details screen and controller
    ├── routes/               # GetX routes and pages
    ├── translations/         # English and Khmer translations
    └── dependency_injection.dart
```

## Routes

| Route | Screen |
| --- | --- |
| `/home` | Latest news feed |
| `/news-details` | Selected article details |

## Customization

- Change the app name in the Android and iOS platform configuration.
- Update the Android application ID and iOS bundle identifier before publishing.
- Replace the launcher icons and splash images with production assets.
- Adjust the light and dark themes in `lib/main.dart`.
- Add or update translations in `lib/app/translations/app_translation.dart`.
- Change the query, language, country, or result limit in `lib/app/data/providers/api_provider.dart`.

## Development Note

The news model classes were generated with [JSON to Dart](https://javiercbk.github.io/json_to_dart/).
