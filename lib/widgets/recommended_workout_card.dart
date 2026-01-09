import 'package:flutter/material.dart';
import 'package:my_fitness_app/models/recommended_workout.dart';

class RecommendedWorkoutCard extends StatelessWidget {
  final RecommendedWorkout workout;

  const RecommendedWorkoutCard({
    super.key,
    required this.workout,
  });

  Color _getDifficultyColor() {
    switch (workout.difficulty) {
      case WorkoutDifficulty.beginner:
        return Colors.green;
      case WorkoutDifficulty.intermediate:
        return Colors.green;
      case WorkoutDifficulty.advanced:
        return Colors.cyanAccent;
    }
  }

  String _getDifficultyText() {
    switch (workout.difficulty) {
      case WorkoutDifficulty.beginner:
        return 'Beginner';
      case WorkoutDifficulty.intermediate:
        return 'Intermediate';
      case WorkoutDifficulty.advanced:
        return 'Advanced';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to workout detail
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 18, 18, 22),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[900],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: workout.imageUrl != null
                    ? Image.network(
                        workout.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[800],
                            child: Icon(
                              Icons.fitness_center,
                              color: Colors.grey[600],
                              size: 40,
                            ),
                          );
                        },
                      )
                    : Container(
                        color: Colors.grey[800],
                        child: Icon(
                          Icons.fitness_center,
                          color: Colors.grey[600],
                          size: 40,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    workout.description,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getDifficultyColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _getDifficultyText(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        workout.details,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Arrow icon
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[900],
              ),
              child: Icon(
                Icons.chevron_right,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
