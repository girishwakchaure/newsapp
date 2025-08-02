# news_app_clean_architecture

A clean architecture-based Flutter application that fetches real-time news from the [NewsAPI](https://newsapi.org/), supports offline caching using `sqflite`, and provides search functionality, a detailed article view, and responsive UI with light/dark theme support.

---

## 🚀 Setup Instructions

### Prerequisites
- Flutter (latest stable version)
- Android Studio or VS Code
- Internet connection (for API calls)

### How to Run

1. Clone this repository or extract the ZIP:
   ```bash
   git clone https://github.com/yourusername/news_app_assignment.git
   cd news_app_assignment
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Add your NewsAPI key in:
   ```
   lib/core/utils/constants.dart
   ```
   Replace:
   ```dart
   static const String apiKey = 'YOUR_API_KEY_HERE';
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## 🧠 Architecture Overview

This project follows **clean architecture** and is divided into:

### 📁 `data/`
- Handles API calls via `http`
- Uses `sqflite` for offline caching
- Includes model classes and repository implementation

### 📁 `domain/`
- Pure Dart layer with business logic
- Contains entities, use cases, and repository contracts

### 📁 `presentation/`
- UI layer built with Flutter
- Uses `flutter_riverpod` for state management
- Includes pages, providers, and reusable widgets

This separation improves code maintainability, testability, and scalability.

---

## 🧪 Assumptions / Trade-offs

- Used `http` to keep dependencies lightweight
- NewsAPI does not support offline mode, so I cached articles locally using `sqflite`
- Search is implemented on the client side for simplicity
- Pagination is not included due to time constraints

---

## 📝 Features

- ✅ Fetch real-time top headlines using NewsAPI
- ✅ Offline caching using Sqflite
- ✅ Search by title or content
- ✅ View full article with link to source
- ✅ Clean architecture and Riverpod state management
- ✅ Unit and widget tests included
