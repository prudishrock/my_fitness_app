enum ExerciseCategory {
  chest,
  back,
  legs,
  arms,
  core,
  cardio,
}

enum ExerciseDifficulty {
  beginner,
  intermediate,
  advanced,
}

class ExerciseItem {
  final String id;
  final String name;
  final ExerciseCategory primaryMuscle;
  final ExerciseDifficulty difficulty;
  final String? thumbnailUrl;

  const ExerciseItem({
    required this.id,
    required this.name,
    required this.primaryMuscle,
    required this.difficulty,
    this.thumbnailUrl,
  });
}
