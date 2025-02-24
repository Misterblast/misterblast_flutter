import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_messaging.g.dart';

@Riverpod(keepAlive: true)
class FCMService extends _$FCMService {
  final FirebaseMessaging fcmInstance = FirebaseMessaging.instance;

  @override
  Future<void> build() async {
    await _setupFCM();
  }

  Future<void> _setupFCM() async {
    NotificationSettings permission = await fcmInstance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (permission.authorizationStatus != AuthorizationStatus.authorized) {
      return;
    }

    // final token = await fcmInstance.getToken();
    //TODO: REGISTER TOKEN TO BACKEND

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 Foreground message received: ${message.notification?.title}");
      //TODO: HANDLE FOREGROUND NOTIFICATION
    });
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.data);
  //TODO: HANDLE BACKGROUND NOTIFICATION
}
