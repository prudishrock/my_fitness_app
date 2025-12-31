import 'package:flutter/material.dart';
import 'package:my_fitness_app/pages/main_page.dart';

void main() {
  runApp(const MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  const MyFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
