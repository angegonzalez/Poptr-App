import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print('--- FCM TOKEN: ' + token);
    });

    _firebaseMessaging.configure(
      onMessage: (info) {
        print('======== onMessage =======');
        print(info);
      },
      onLaunch: (info) {
        print('======== onLaunch =======');
        print(info);
      },
      onResume: (info) {
        print('======== onResume =======');
        print(info);
      },
    );
  }
}
