# Covid-19 Tracker App 🦠

A Flutter-based mobile app that tracks global COVID-19 statistics in real time. It pulls data from the disease.sh API and presents a clean dashboard for worldwide totals, country-specific insights, and detailed case breakdowns.

## Features

- Global overview with total cases, recovered patients, and deaths
- Country list with search support
- Detailed country information screen
- Active, critical, and today’s cases tracking
- Dark-mode UI with shimmer loading indicators
- Animated transitions and smooth user experience

## Tech Stack

- Flutter + Dart
- REST API integration using `http`
- `pie_chart` for data visualization
- `flutter_spinkit` for loading indicators
- `shimmer` for skeleton effects
- `animated_text_kit` for UI animation

## Screenshots

| Splash Screen | World Stats | Country Details |
|:---:|:---:|:---:|
| <img src="assets/virus.png" width="150"> | Coming soon | Coming soon |

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/zohaibhassanpk/covid-19-tracker-flutter.git
   ```
2. Open the project directory:
   ```bash
   cd covid-19-tracker-flutter
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/` — application source code
- `assets/` — project assets and images
- `test/` — widget and app tests
- `web/` — web configuration files
- `android/` and `ios/` — platform-specific setup

## Contribution

Contributions are welcome. Feel free to open an issue or submit a pull request with improvements, bug fixes, or UI enhancements.
