# misterblast_flutter

Mobile Application part of Misterblast App

Core Dependencies :

- Http Networking => [Flutter Dio](https://pub.dev/packages/dio)
- Local Storage => https://pub.dev/packages/shared_preferences
- State Management => https://pub.dev/packages/flutter_riverpod & https://pub.dev/packages/riverpod_annotation
- Localization => https://pub.dev/packages/easy_localization
- Third Party Services :

  - https://pub.dev/packages/firebase_core
  - Notification => [firebase_messaging](https://pub.dev/packages/firebase_messaging)
- Utils :

  - https://pub.dev/packages/freezed
  - https://pub.dev/packages/build_runner

How to Run :

1. setup .env file
   make sure it contain the following keys
   FIREBASE_API_KEY
   FIREBASE_APP_ID
   FIREBASE_MESSAGING_SENDER_ID
   FIREBASE_PROJECT_ID
   FIREBASE_STORAGE_BUCKET
