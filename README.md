# greenhands

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


dart run flutter_native_splash:create
dart run flutter_launcher_icons:generate
dart run build_runner build - delete-conflicting-outputs
dart run build_runner build --delete-conflicting-outputs --force-jit
flutter pub run easy_localization:generate -S ./assets/locales -O ./lib/config
flutter build apk --target-platform android-arm64 --analyze-size
flutter build appbundle --target-platform android-arm64 --analyze-size
pm2 start "npx serve -s build/web -l 5555" --name "flutter-daily"

