import 'package:flutter/material.dart';
import 'package:my_fitness_app/models/meal.dart';

class MealHelpers {
  static IconData getMealIcon(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return Icons.wb_sunny;
      case MealType.lunch:
        return Icons.lunch_dining;
      case MealType.dinner:
        return Icons.dinner_dining;
      case MealType.snacks:
        return Icons.cookie;
    }
  }

  static Color getMealIconColor(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return Colors.amber;
      case MealType.lunch:
        return Colors.orange;
      case MealType.dinner:
        return Colors.purple;
      case MealType.snacks:
        return Colors.green;
    }
  }

  static String getMealName(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return 'Breakfast';
      case MealType.lunch:
        return 'Lunch';
      case MealType.dinner:
        return 'Dinner';
      case MealType.snacks:
        return 'Snacks';
    }
  }
}
