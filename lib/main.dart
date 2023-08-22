import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants/constants.dart';
import 'package:flutter_calculator/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        // brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: colorSeed),
        fontFamily: 'Inter',
        // useMaterial3: true,
      ),
      home: HomeScreen(title: 'Calculator'),
    );
  }
}
