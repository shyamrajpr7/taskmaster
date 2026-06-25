import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GameVerseApp());
}

class GameVerseApp extends StatelessWidget {
  const GameVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameVerse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A1A),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFFD700),
          secondary: const Color(0xFF6C5CE7),
          surface: const Color(0xFF0F0F23),
        ),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const HomeScreen(),
    );
  }
}
