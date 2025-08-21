# Dyma Flutter Project

![Flutter](https://img.shields.io/badge/Flutter-3.22-blue)
![Dart](https://img.shields.io/badge/Dart-3.4-blue)

A Flutter project created for learning and experimenting with Flutter development.

## Summary

- [Dyma Flutter Project](#dyma-flutter-project)
  - [Summary](#summary)
  - [GitHub](#github)
    - [🚀 Getting Started](#-getting-started)
    - [🔄 Recommended Git Workflow](#-recommended-git-workflow)
    - [📌 Useful Commands](#-useful-commands)
  - [Project structure](#project-structure)
  - [Use a Dart \& Flutter package](#use-a-dart--flutter-package)

## GitHub

### 🚀 Getting Started

- Clone the repository

  ```bash
  git clone https://github.com/teowaep/dyma_flutter_project.git
  cd dyma_flutter_project
  ```

- Install dependencies

  ```bash
  flutter pub get
  ```

- Run the app
  ```bash
  flutter run
  ```

### 🔄 Recommended Git Workflow

1. **Update your local project before working**

   ```bash
   git pull
   ```

2. **Make your changes**

3. **Save and push changes**
   ```bash
   git add .
   git commit -m "Describe your changes"
   git push
   ```

### 📌 Useful Commands

- Check project status

  ```bash
  git status
  ```

- View commit history

  ```bash
  git log --oneline
  ```

## Project structure

```text
lib/
  datas/            # local data
  models/           # data classes
  view/             # all UI
    folder/         # pages features
      widgets/      # reusable UI components
  main.dart         # entry point
```

## Use a Dart & Flutter package

1. [Search package here](https://pub.dev/)
2. Copy package name and paste in _**pubspec.yaml**_, at _dependencies_ :

   ```yaml
   dependencies:
     flutter:
       sdk: flutter

     cupertino_icons: ^1.0.8
     intl: ^0.20.2
   ```

   _**^** : means that we want to use the most recent dependencies_

3. Save file
4. Import the package in the file where you want to use it
