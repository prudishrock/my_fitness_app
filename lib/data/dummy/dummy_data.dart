import 'package:my_fitness_app/models/user_profile.dart';
import 'package:my_fitness_app/models/nutrition_targets.dart';
import 'package:my_fitness_app/models/nutrition_day_summary.dart';
import 'package:my_fitness_app/models/meal.dart';
import 'package:my_fitness_app/models/exercise.dart';
import 'package:my_fitness_app/models/workout_program.dart';
import 'package:my_fitness_app/models/recommended_workout.dart';

// User Profile
const dummyUserProfile = UserProfile(
  id: '1',
  name: 'Alex',
  goal: Goal.maintain,
  trainingLevel: TrainingLevel.intermediate,
);

// Nutrition Targets
const dummyTargets = NutritionTargets(
  dailyCalorieTarget: 2400,
  proteinTargetG: 180,
  carbsTargetG: 250,
  fatTargetG: 70,
  waterTargetMl: 3000,
);

// Today's Summary
final dummyTodaySummary = NutritionDaySummary(
  date: DateTime.now(),
  caloriesConsumed: 1250,
  proteinConsumedG: 120,
  carbsConsumedG: 150,
  fatConsumedG: 50,
  waterConsumedMl: 1250,
);

// Meal Logs
final dummyMealLogs = <MealType, MealLog>{
  MealType.breakfast: MealLog(
    mealType: MealType.breakfast,
    items: const [
      MealItem(
        id: '1',
        name: 'Oatmeal & Berries',
        servingText: '1 bowl (250g)',
        kcal: 350,
        proteinG: 12,
        carbsG: 65,
        fatG: 8,
      ),
      MealItem(
        id: '2',
        name: 'Black Coffee',
        servingText: '1 cup',
        kcal: 5,
        proteinG: 0,
        carbsG: 0,
        fatG: 0,
      ),
    ],
  ),
  MealType.lunch: MealLog(
    mealType: MealType.lunch,
    items: const [],
  ),
  MealType.dinner: MealLog(
    mealType: MealType.dinner,
    items: const [
      MealItem(
        id: '3',
        name: 'Chicken & Rice',
        servingText: '1 serving (350g)',
        kcal: 620,
        proteinG: 55,
        carbsG: 70,
        fatG: 15,
      ),
    ],
  ),
  MealType.snacks: MealLog(
    mealType: MealType.snacks,
    items: const [
      MealItem(
        id: '4',
        name: 'Greek Yogurt',
        servingText: '1 cup (200g)',
        kcal: 140,
        proteinG: 25,
        carbsG: 8,
        fatG: 3,
      ),
    ],
  ),
};

// Exercise Categories
const dummyExerciseCategories = [
  ExerciseCategory.chest,
  ExerciseCategory.back,
  ExerciseCategory.legs,
  ExerciseCategory.arms,
  ExerciseCategory.core,
  ExerciseCategory.cardio,
];

// Exercise Library
const dummyExerciseLibrary = [
  // Chest
  ExerciseItem(
    id: '1',
    name: 'Tech-Bar Bench Press',
    primaryMuscle: ExerciseCategory.chest,
    difficulty: ExerciseDifficulty.advanced,
  ),
  ExerciseItem(
    id: '2',
    name: 'Incline DB Press',
    primaryMuscle: ExerciseCategory.chest,
    difficulty: ExerciseDifficulty.beginner,
  ),
  ExerciseItem(
    id: '3',
    name: 'Cable Flys',
    primaryMuscle: ExerciseCategory.chest,
    difficulty: ExerciseDifficulty.intermediate,
  ),
  // Back
  ExerciseItem(
    id: '4',
    name: 'Pull-up',
    primaryMuscle: ExerciseCategory.back,
    difficulty: ExerciseDifficulty.intermediate,
  ),
  ExerciseItem(
    id: '5',
    name: 'Barbell Row',
    primaryMuscle: ExerciseCategory.back,
    difficulty: ExerciseDifficulty.intermediate,
  ),
  ExerciseItem(
    id: '6',
    name: 'Lat Pulldown',
    primaryMuscle: ExerciseCategory.back,
    difficulty: ExerciseDifficulty.beginner,
  ),
  // Legs
  ExerciseItem(
    id: '7',
    name: 'Neural Deadlift',
    primaryMuscle: ExerciseCategory.legs,
    difficulty: ExerciseDifficulty.advanced,
  ),
  ExerciseItem(
    id: '8',
    name: 'Barbell Squat',
    primaryMuscle: ExerciseCategory.legs,
    difficulty: ExerciseDifficulty.intermediate,
  ),
  ExerciseItem(
    id: '9',
    name: 'Romanian Deadlift',
    primaryMuscle: ExerciseCategory.legs,
    difficulty: ExerciseDifficulty.intermediate,
  ),
  // Arms
  ExerciseItem(
    id: '10',
    name: 'Biceps Curl',
    primaryMuscle: ExerciseCategory.arms,
    difficulty: ExerciseDifficulty.beginner,
  ),
  ExerciseItem(
    id: '11',
    name: 'Triceps Pushdown',
    primaryMuscle: ExerciseCategory.arms,
    difficulty: ExerciseDifficulty.beginner,
  ),
  ExerciseItem(
    id: '12',
    name: 'Hammer Curl',
    primaryMuscle: ExerciseCategory.arms,
    difficulty: ExerciseDifficulty.beginner,
  ),
  // Core
  ExerciseItem(
    id: '13',
    name: 'Plank',
    primaryMuscle: ExerciseCategory.core,
    difficulty: ExerciseDifficulty.beginner,
  ),
  ExerciseItem(
    id: '14',
    name: 'Hanging Leg Raise',
    primaryMuscle: ExerciseCategory.core,
    difficulty: ExerciseDifficulty.intermediate,
  ),
  ExerciseItem(
    id: '15',
    name: 'Russian Twist',
    primaryMuscle: ExerciseCategory.core,
    difficulty: ExerciseDifficulty.beginner,
  ),
  // Cardio
  ExerciseItem(
    id: '16',
    name: 'Treadmill Intervals',
    primaryMuscle: ExerciseCategory.cardio,
    difficulty: ExerciseDifficulty.intermediate,
  ),
  ExerciseItem(
    id: '17',
    name: 'Zone 2 Ride',
    primaryMuscle: ExerciseCategory.cardio,
    difficulty: ExerciseDifficulty.beginner,
  ),
  ExerciseItem(
    id: '18',
    name: 'Rowing Machine',
    primaryMuscle: ExerciseCategory.cardio,
    difficulty: ExerciseDifficulty.intermediate,
  ),
];

// Workout Programs
const dummyWorkoutPrograms = [
  WorkoutProgram(
    id: '1',
    title: 'Push / Pull Destruction',
    status: 'ACTIVE',
    progressPercent: 75,
    tags: ['Hypertrophy', 'Advanced'],
    daysPerWeek: 4,
    durationMins: 60,
  ),
  WorkoutProgram(
    id: '2',
    title: 'Full Body Conditioning',
    status: 'PAUSED',
    progressPercent: 30,
    tags: ['Cardio'],
    daysPerWeek: 3,
    durationMins: 30,
  ),
  WorkoutProgram(
    id: '3',
    title: 'Strength Builder',
    status: 'ACTIVE',
    progressPercent: 50,
    tags: ['Strength', 'Intermediate'],
    daysPerWeek: 5,
    durationMins: 75,
  ),
];

// Recommended Workouts
const dummyRecommendedWorkouts = [
  RecommendedWorkout(
    id: '1',
    title: 'German Volume Training',
    description: 'High volume method for mass gains.',
    difficulty: WorkoutDifficulty.advanced,
    details: '10x10 sets',
    imageUrl:
        'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
  ),
  RecommendedWorkout(
    id: '2',
    title: 'Push-Pull-Legs',
    description: 'Classic split for aesthetics and size.',
    difficulty: WorkoutDifficulty.intermediate,
    details: '6 days/week',
    imageUrl:
        'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400',
  ),
  RecommendedWorkout(
    id: '3',
    title: 'Arnold Split',
    description: 'Focus on chest/back & shoulders/arms.',
    difficulty: WorkoutDifficulty.advanced,
    details: '6 days/week',
    imageUrl:
        'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400',
  ),
];
