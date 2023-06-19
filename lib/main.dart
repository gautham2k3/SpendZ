import 'package:flutter/material.dart';
import 'Screens/tabs_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing App',
      home: tabs_manager(),
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
    );
  }
}