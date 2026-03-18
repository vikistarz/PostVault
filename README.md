# Flutter Posts App

A Flutter app that fetches posts from a REST API, displays them in a list, allows users to mark favorites, and view post details.

## Features

- Fetch posts from API
- Favorite/unfavorite posts using Riverpod
- Post detail screen with scrollable and styled content
- Clean UI design

## Architecture & Libraries

- **Architecture**: MVVM-like with Repository pattern
- **State Management**: Riverpod
- **HTTP Requests**: `http` package
- **JSON Parsing**: Dart `convert` library
- **UI**: Flutter widgets, `Card`, `ListTile`, `AppBar`
- **Favorites**: `StateNotifier` + `Set<int>` to track favorite post IDs

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/vikistarz/PostVault.git
