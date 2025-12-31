import 'package:flutter/material.dart';
import 'package:my_fitness_app/pages/main_page.dart';
import 'package:my_fitness_app/pages/meal_page.dart';

class NavigationHelper {
  static void navigateToPage(
      BuildContext context, int index, int currentIndex) {
    // Eğer aynı sayfadaysak, navigation yapma
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        // Home (Main Page)
        if (currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        }
        break;
      case 1:
        // Exercises page - TODO: Create ExercisesPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text('Exercises Page')),
            ),
          ),
        );
        break;
      case 2:
        // Meals page
        if (currentIndex != 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MealPage()),
          );
        }
        break;
      case 3:
        // Profile page - TODO: Create ProfilePage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text('Profile Page')),
            ),
          ),
        );
        break;
    }
  }
}
