# AuraTrack: Mood & Focus Tracker

## Overview

AuraTrack is a Flutter-based mobile application designed to help users track their daily mood, energy, and focus levels. By providing a simple and intuitive interface, the app encourages users to perform daily check-ins, offering them valuable insights into their well-being over time. The app features a clean, modern design with both light and dark themes, weekly progress visualizations, and a persistent data storage solution to ensure user data is always saved.

## Key Features

- **Daily Check-Ins**: A guided, multi-step process for users to record their energy, focus, and mood levels on a scale of 1-10. Users can also add optional notes to provide more context for each check-in.
- **Weekly Insights**: A visual representation of the user's data from the past seven days, displayed in a bar chart. This allows for easy tracking of trends and patterns in their well-being.
- **Persistent Storage**: All check-in data is stored locally on the device using Hive, a lightweight and fast NoSQL database. This ensures that user data is always available, even when offline.
- **Theming**: The app supports both light and dark modes, with a modern, clean design that is easy on the eyes. Users can toggle between themes or set their preference to follow the system theme.

## Design

- **Typography**: The app uses the `google_fonts` package with the Poppins font for a clean, modern aesthetic. The typography is designed to be highly readable, with a clear visual hierarchy for headings, titles, and body text.
- **Color Scheme**: The color palette is based on Material Design 3 principles, with a primary seed color of blue. The `ColorScheme.fromSeed` constructor generates a harmonious and accessible color scheme for both light and dark modes.
- **Iconography**: The app uses standard Material Design icons for actions such as toggling the theme, adding notes, and navigating between screens. The icons are designed to be intuitive and easy to understand.

## Architecture

- **State Management**: The app uses the `provider` package for simple, centralized state management. The `ThemeProvider` class manages the app's theme, while the UI is built using a combination of `StatelessWidget` and `StatefulWidget` where local state is required.
- **Data Layer**: The data layer is built using the `hive` package for local storage. The `HiveService` class abstracts all database operations, providing a clean API for adding, retrieving, and managing check-in data.
- **Navigation**: The app uses `MaterialPageRoute` for basic, imperative navigation between screens. The navigation is designed to be straightforward and intuitive, allowing users to easily move between the dashboard, check-in screen, and weekly insights.
