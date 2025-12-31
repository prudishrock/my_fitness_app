import 'package:flutter/material.dart';
import 'package:my_fitness_app/widgets/macro_card.dart';
import 'package:my_fitness_app/widgets/exercise_card.dart'
    show ExerciseCard, Difficulty;
import 'package:my_fitness_app/widgets/calorie_progress_card.dart';
import 'package:my_fitness_app/widgets/bottom_navigation_bar.dart';
import 'package:my_fitness_app/widgets/gradient_background.dart';
import 'package:my_fitness_app/data/dummy/dummy_data.dart';
import 'package:my_fitness_app/models/exercise.dart';
import 'package:my_fitness_app/utils/navigation_helper.dart';
import 'package:my_fitness_app/utils/padding_helper.dart';
import 'package:my_fitness_app/utils/exercise_helpers.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedFilter = 'All';
  final List<String> filters = [
    'All',
    ...dummyExerciseCategories
        .map((cat) => ExerciseHelpers.getCategoryName(cat))
  ];
  int currentBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentBottomNavIndex,
        onTap: (index) {
          final previousIndex = currentBottomNavIndex;
          setState(() {
            currentBottomNavIndex = index;
          });
          NavigationHelper.navigateToPage(context, index, previousIndex);
        },
      ),
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                withPadding(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      Column(
                        children: [
                          Text(
                            "Hello ${dummyUserProfile.name},",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Let's get fit!",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                ),

                CalorieProgressCard(
                  consumed: dummyTodaySummary.caloriesConsumed,
                  goal: dummyTargets.dailyCalorieTarget,
                ),
                SizedBox(height: 20),

                //MACRO CARDS
                withPadding(
                  Row(
                    children: [
                      Expanded(
                        child: MacroCard(
                          title: 'PROTEIN',
                          value: '${dummyTodaySummary.proteinConsumedG} g',
                          color: Colors.purpleAccent,
                          icon: Icons.science,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MacroCard(
                          title: 'CARBS',
                          value: '${dummyTodaySummary.carbsConsumedG} g',
                          color: Colors.cyanAccent,
                          icon: Icons.bar_chart,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MacroCard(
                          title: 'FAT',
                          value: '${dummyTodaySummary.fatConsumedG} g',
                          color: Colors.pinkAccent,
                          icon: Icons.water_drop,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                //LOG MEAL INTAKE
                withPadding(
                  InkWell(
                    onTap: () {
                      // TODO: Handle meal intake logging
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 30, 30, 35),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.lime,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            'LOG MEAL INTAKE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  horizontalOnly: true,
                ),

                SizedBox(height: 10),

                withPadding(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Excercise Library",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "VIEW ALL",
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                //FILTERS
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      final isSelected = filter == selectedFilter;
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < filters.length - 1 ? 12 : 0,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.cyanAccent
                                  : const Color.fromARGB(255, 30, 30, 35),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                filter,
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                //EXERCISE CARDS
                withPadding(
                  Column(
                    children: ExerciseHelpers.filterByCategory(
                      dummyExerciseLibrary,
                      selectedFilter == 'All' ? null : selectedFilter,
                    ).take(3).map((exercise) {
                      // Map ExerciseDifficulty to Difficulty enum
                      Difficulty difficulty;
                      switch (exercise.difficulty) {
                        case ExerciseDifficulty.beginner:
                          difficulty = Difficulty.medium;
                          break;
                        case ExerciseDifficulty.intermediate:
                          difficulty = Difficulty.hard;
                          break;
                        case ExerciseDifficulty.advanced:
                          difficulty = Difficulty.extreme;
                          break;
                      }

                      return ExerciseCard(
                        title: exercise.name,
                        subtitle: ExerciseHelpers.getCategoryName(
                            exercise.primaryMuscle),
                        imageUrl: exercise.thumbnailUrl ??
                            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
                        difficulty: difficulty,
                        sets: 3,
                        reps: 12,
                        onTap: () {
                          // TODO: Navigate to exercise detail
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
