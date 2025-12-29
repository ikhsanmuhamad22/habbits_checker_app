import 'package:flutter/material.dart';
import 'package:habbits_checker/pages/main_page.dart';
import 'package:habbits_checker/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit checker',
      theme: AppTheme.lightTheme,
      home: MainPage(),
    );
  }
}
