import 'package:fcm/firebase/firebase_api.dart';
import 'package:fcm/pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'pages/home_screen.dart';
import 'pages/notification_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Push Notification",
     navigatorKey: navigatorKey,
     home: const HomeScreen(),
     routes: {
       NotificationScreen.route: (context) => const NotificationScreen()
     }
    );
  }
} 