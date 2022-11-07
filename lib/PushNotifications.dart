import 'package:flutter/material.dart';

class PushNotifications extends StatelessWidget {
  const PushNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: PushNotificationsMain(),
        debugShowCheckedModeBanner: false,
      );
}

class PushNotificationsMain extends StatefulWidget {
  const PushNotificationsMain({super.key});

  @override
  State<PushNotificationsMain> createState() => _PushNotificationsMainState();
}

class _PushNotificationsMainState extends State<PushNotificationsMain> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('center')),
    );
  }
}
