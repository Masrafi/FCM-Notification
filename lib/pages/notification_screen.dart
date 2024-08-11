import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route = '/notification';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
    appBar: AppBar(
    title: const Text("Push Notification"),
    ),
    body:  Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${message}'),
        const Text('Push Notification Screen'),
        const Text('Push Notification Screen')
      ],),
    ),
    );
  }
}
