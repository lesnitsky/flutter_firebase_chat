# flutter_firebase_chat

GDG Minsk 2020-02-07 meetup demo

[![lesnitsky.dev](https://lesnitsky.dev/icons/shield.svg?hash=42)](https://lesnitsky.dev?utm_source=flutter_firebase_chat)
[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/flutter_firebase_chat.svg?style=social)](https://github.com/lesnitsky/todolist_flutter)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

## Getting Started

- Create firebase project
- Download `google-services.json` and `GoogleService-Info.plist`
- Add these files to appropriate locations:

  - `android/app/google-services.json`
  - `ios/Runner/GoogleService-Info.plist`

- Apply the rules below to your database

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

⚠️ This configuration is not intended for production use. [Read more about firestore security rules here](https://firebase.google.com/docs/firestore/security/get-started)

- `flutter packages get`
- `flutter run`

## License

MIT

## Author

[Andrei Lesnitsky](https://lesnitsky.dev)
