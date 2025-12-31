import 'package:my_fitness_app/models/exercise.dart';

class ExerciseHelpers {
  static String getCategoryName(ExerciseCategory category) {
    switch (category) {
      case ExerciseCategory.chest:
        return 'Chest';
      case ExerciseCategory.back:
        return 'Back';
      case ExerciseCategory.legs:
        return 'Legs';
      case ExerciseCategory.arms:
        return 'Arms';
      case ExerciseCategory.core:
        return 'Core';
      case ExerciseCategory.cardio:
        return 'Cardio';
    }
  }

  static String getCategoryDisplayName(ExerciseCategory category) {
    return getCategoryName(category).toUpperCase();
  }

  static List<ExerciseItem> filterByCategory(
    List<ExerciseItem> exercises,
    String? categoryName,
  ) {
    if (categoryName == null || categoryName == 'All') {
      return exercises;
    }

    final category = ExerciseCategory.values.firstWhere(
      (cat) => getCategoryName(cat) == categoryName,
      orElse: () => ExerciseCategory.chest,
    );

    return exercises.where((ex) => ex.primaryMuscle == category).toList();
  }
}
