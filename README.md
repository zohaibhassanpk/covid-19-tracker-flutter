# Covid-19 Tracker App 🦠

A real-time Covid-19 tracking application built with **Flutter**. This app fetches data from a global API to display worldwide statistics and provides detailed country-wise breakdowns of cases, deaths, and recoveries.

## 🚀 Features

*   **Global Dashboard**: View total cases, recovered, and deaths worldwide visualized with a responsive **Pie Chart**.
*   **Country Tracking**: Browse a list of all countries or **search** for a specific one to view detailed statistics.
*   **Detailed Insights**: Click on any country to see specific data including active cases, critical conditions, and today's stats.
*   **Smooth UI/UX**:
    *   **Dark Mode** design for better visual comfort.
    *   **Shimmer Effects** for loading states.
    *   **Animated Text** and transitions for an engaging user experience.
    *   **Pull-to-Refresh** capability (if applicable, otherwise standard data fetching).

## 🛠️ Tech Stack

*   **Framework**: [Flutter](https://flutter.dev/) (Dart)
*   **Architecture**: MVVM (Model-View-ViewModel) pattern
*   **API**: [disease.sh](https://disease.sh/) (or whichever API you used)
*   **Key Packages**:
    *   `http`: For REST API integration.
    *   `pie_chart`: For visualizing data.
    *   `flutter_spinkit`: For custom loading indicators.
    *   `shimmer`: For loading skeleton effects.
    *   `animated_text_kit`: For text animations.

## 📸 Screenshots

| Splash Screen | World Stats | Country List |
|:---:|:---:|:---:|
| <img src="assets/virus.png" width="150"> | *(Add screenshot)* | *(Add screenshot)* |

*(Note: Replace placeholders with actual screenshots of your app)*

## 🏁 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/covid_19_tracker.git
    ```
2.  **Navigate to the project directory**:
    ```bash
    cd covid_19_tracker
    ```
3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
4.  **Run the app**:
    ```bash
    flutter run
    ```

## 🤝 Contribution

Contributions are welcome! Feel free to open an issue or submit a pull request.
