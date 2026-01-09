enum WorkoutDifficulty {
  beginner,
  intermediate,
  advanced,
}

class RecommendedWorkout {
  final String id;
  final String title;
  final String description;
  final WorkoutDifficulty difficulty;
  final String details; // e.g., "10x10 sets" or "6 days/week"
  final String? imageUrl;

  const RecommendedWorkout({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.details,
    this.imageUrl,
  });
}
