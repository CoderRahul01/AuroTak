
# AuraTrack: App Blueprint

## 1. Overview

AuraTrack is a minimalist Flutter application designed for daily self-awareness. It allows users to quickly check in on their energy, focus, and mood, track trends over time, and build a better understanding of their well-being. The app is designed to be fast, intuitive, and private, with all data stored locally on the device.

## 2. Core Features & Design

### Style & Design
- **Minimalist UI:** Clean, calm, and uncluttered interface.
- **Color Palette:** A soothing palette with distinct colors for light and dark modes.
- **Typography:** Expressive and clear fonts using `google_fonts`.
- **Interactivity:** Gesture-first navigation, smooth animations, and large, touch-friendly components.

### Features
- **Daily Check-In:** A guided, swipe-based flow to record energy, focus, and mood.
- **Dashboard:** An at-a-glance view of today's check-in, current streak, and weekly averages.
- **Weekly Insights:** Visual charts to track energy, focus, and mood over the last 7 days.
- **Streak System:** Motivates daily check-ins by tracking consecutive days.
- **Theming:** Supports light, dark, and system theme modes.

## 3. Technical Plan

### Architecture
- **Structure:** A feature-first layered architecture to separate concerns and improve scalability.
  - `lib/core`: Shared utilities, theming, and constants.
  - `lib/data`: Data models and local storage services.
  - `lib/features`: Individual feature modules (check-in, dashboard, insights).
  - `lib/main.dart`: App entry point and root configuration.
- **State Management:** `provider` for managing app-wide state like theme and check-in data.
- **Local Storage:** `hive` for fast, efficient, and reliable on-device data storage.

### Current Implementation Steps
1. **Project Setup:**
   - Create core directories: `core`, `data`, `features`.
   - Add dependencies: `provider`, `hive`, `hive_flutter`, `fl_chart`, `google_fonts`.
2. **Theming:**
   - Implement `ThemeProvider` to manage light/dark/system modes.
   - Define `ThemeData` for both light and dark themes with custom fonts and colors.
3. **Main Application:**
   - Initialize Hive for local storage.
   - Set up `ChangeNotifierProvider` for the `ThemeProvider`.
   - Configure the `MaterialApp` to use the dynamic theme.
4. **Initial UI:**
   - Create a placeholder `DashboardScreen` as the home page.
