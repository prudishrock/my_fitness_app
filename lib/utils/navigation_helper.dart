import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelper {
  static void navigateToPage(
      BuildContext context, int index, int currentIndex) {
    // Eğer aynı sayfadaysak, navigation yapma
    if (index == currentIndex) return;

    // Build sonrasında navigation yapmak için microtask kullan
    Future.microtask(() {
      if (!context.mounted) return;

      switch (index) {
        case 0:
          // Home (Main Page)
          if (currentIndex != 0) {
            context.go('/');
          }
          break;
        case 1:
          // Exercises/Workout page
          if (currentIndex != 1) {
            context.go('/workout');
          }
          break;
        case 2:
          // Meals page
          if (currentIndex != 2) {
            context.go('/meals');
          }
          break;
        case 3:
          // Profile page
          if (currentIndex != 3) {
            context.go('/profile');
          }
          break;
      }
    });
  }

  static void navigateToHome(BuildContext context) {
    Future.microtask(() {
      if (!context.mounted) return;
      context.go('/');
    });
  }
}
