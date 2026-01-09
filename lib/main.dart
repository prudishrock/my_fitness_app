import 'package:flutter/material.dart';
import 'package:my_fitness_app/routes/app_router.dart';

void main() {
  runApp(const MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  const MyFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
