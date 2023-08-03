import 'package:flutter/material.dart';
import 'package:flutter_task_listing_application/scenes/app_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
