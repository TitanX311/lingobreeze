import 'package:flutter/material.dart';
import 'package:lingobreeze/pages/onboarding_welcome.dart';

void main() {
  runApp(const LingoBreezeApp());
}

/// The root widget of the application.
class LingoBreezeApp extends StatelessWidget {
  const LingoBreezeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LingoBreeze',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF06213D),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingWelcome(),
    );
  }
}
