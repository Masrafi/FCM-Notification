import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcm/main.dart';
import 'package:fcm/pages/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print("......................................");
//   print("Title: ${message.notification?.title}"); 
//   print("Body: ${message.notification?.body}");
//   print("Payload: ${message.data}");
// }

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  
  //local notification
  final _androidChannel = const AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notification',
  description: "This channel is used for important notification",
  importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();
  
  // for route
  // void handleMessage(RemoteMessage? message) {
  //   if(message == null) return;
  //   print("......................................");
  //   navigatorKey.currentState?.pushNamed(
  //   NotificationScreen.route,
  //   arguments: message
  //   );
  // }
  static Future<void> onDidReceiveNotification(NotificationResponse notificationResponse) async {
    print("......................................");
      print("Notification receive");
       navigatorKey.currentState?.pushNamed(
          NotificationScreen.route,
          arguments: notificationResponse
          );
    }
  //notification
  Future initLocalNotifications() async {
    const DarwinInitializationSettings ios = DarwinInitializationSettings();
    
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    //const settings = InitializationSettings(android: android, iOS: iOS);
    const InitializationSettings initializationSettings = InitializationSettings(
          android: android,
          iOS: ios,
        );
    
    // await _localNotifications.initialize(
    // settings,
    // onSelectNotification: (payload) {
    //   final message = RemoteMessage.fromMap(jsonDecode(payload!));
    //   handleMessage(message);
    // }
    // );
    await _localNotifications.initialize(
          initializationSettings,
          onDidReceiveNotificationResponse: onDidReceiveNotification,
          onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
        );
    
        // await _localNotifications
        //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        //     ?.requestNotificationsPermission();
        
    final playform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await playform?.createNotificationChannel(_androidChannel);
  }
  Future initPushNotification() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
    );
    // FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    //notification
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      
      _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
      android: AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      icon: '@drawable/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails()
      ),
      payload: jsonEncode(message.toMap()),
      );
    });
  }
  
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("Token: $fcmToken");
    await FirebaseFirestore.instance
            .collection('tokens')
            .doc('mas') // Use a unique document ID for each user/device
            .set({'token': fcmToken});
    //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotification();
    //notification
    initLocalNotifications();
  }
}