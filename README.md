# Flutter Reactive Login Form

A simple login form built with Flutter, using the BLoC pattern, Streams, and RxDart for reactive validation and state management.

Although the UI is minimal (Email, Password, Login button), the project demonstrates important architectural and reactive programming concepts.

🚀 # Features

✅ Real-time email validation

✅ Real-time password validation

✅ Reactive button enable/disable

✅ Clean separation of UI and business logic

✅ Custom Provider using InheritedWidget

✅ RxDart combineLatest usage

🏗 # Architecture Overview

This project follows the BLoC (Business Logic Component) pattern.

## UI Layer

LoginScreen

StreamBuilder

Stateless widgets only

## Business Logic Layer

Bloc

Streams for email and password

Validation logic using StreamTransformer

## Dependency Injection

Custom Provider built with InheritedWidget

🔄 # How It Works
1️⃣ ## User Input

When the user types in a TextField:

onChanged: bloc.changeEmail

The input is added to a Stream via:

_emailController.sink.add(value);
2️⃣ # Validation

Each stream is transformed:

_emailController.stream.transform(validateEmail)

If valid → data passes
If invalid → error is emitted

The StreamBuilder listens and displays validation errors instantly.

3️⃣ # Button Activation (Reactive Logic)

Using RxDart:

Rx.combineLatest2(email, password, (e, p) => true);

The login button becomes enabled only when both email and password are valid.

onPressed: snapshot.hasData ? bloc.submit : null

No manual boolean flags.
No setState().

Fully reactive.

📂 # Project Structure
lib/
│
├── main.dart
├── src/
│   ├── app.dart
│   ├── screens/
│   │   └── login_screen.dart
│   └── blocs/
│       ├── bloc.dart
│       ├── provider.dart
│       └── validators.dart

🧠 # Concepts Demonstrated

Reactive Programming

Streams & Sinks

StreamTransformer

RxDart (BehaviorSubject & combineLatest)

BLoC Pattern

InheritedWidget

Separation of Concerns

🛠 # Dependencies
dependencies:
  flutter:
    sdk: flutter
  rxdart: ^0.27.0
🎯 # Why This Project?

This project is not about authentication.

It is about understanding:

How Flutter handles asynchronous data

How to separate UI from business logic

How reactive state management works internally

It serves as a foundational step toward more advanced state management solutions like:

Provider

Riverpod

Bloc library

Clean Architecture

▶ # How to Run
git clone https://github.com/your-username/flutter-reactive-login.git
cd flutter-reactive-login
flutter pub get
flutter run
📌 # Future Improvements

Add actual authentication logic (API integration)

Implement loading states

Add unit tests for validation logic

Replace custom Provider with official state management solutions

Dispose BLoC properly at app shutdown

📚 # Learning Purpose

This project was built as a learning exercise to deeply understand:

Streams

RxDart

Reactive UI updates

State management patterns

👨‍💻 # Author

Built as part of my Flutter learning journey.

If you found this helpful, feel free to ⭐ the repo.

# Udemy course: https://www.udemy.com/course/dart-and-flutter-the-complete-developers-guide/
