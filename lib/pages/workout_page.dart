import 'package:flutter/material.dart';
import 'package:my_fitness_app/utils/padding_helper.dart';
import 'package:my_fitness_app/widgets/gradient_background.dart';
import 'package:my_fitness_app/widgets/bottom_navigation_bar.dart';
import 'package:my_fitness_app/widgets/my_programs_carousel.dart';
import 'package:my_fitness_app/widgets/recommended_workout_card.dart';
import 'package:my_fitness_app/data/dummy/dummy_data.dart';
import 'package:my_fitness_app/utils/navigation_helper.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  int currentBottomNavIndex = 1; // Workout page index 1
  String selectedWorkoutType = 'Bodybuilding';

  final List<String> workoutTypes = [
    'Bodybuilding',
    'Strength',
    'Mobility',
    'Conditioning'
  ];

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                withPadding(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          NavigationHelper.navigateToHome(context);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Text(
                        'Workout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.person, color: Colors.white),
                    ],
                  ),
                  horizontalOnly: true,
                ),
                const SizedBox(height: 20),

                // My Programs Row
                withPadding(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Programs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // My Programs Cards
                MyProgramsCarousel(
                  programs: dummyWorkoutPrograms,
                ),

                SizedBox(height: 10),

                withPadding(
                  Text(
                    "Recomended Workouts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: workoutTypes.length,
                    itemBuilder: (context, index) {
                      final workoutType = workoutTypes[index];
                      final isSelected = workoutType == selectedWorkoutType;
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < workoutTypes.length - 1 ? 12 : 0,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedWorkoutType = workoutType;
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
                                color: isSelected
                                    ? Colors.cyanAccent
                                    : Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                workoutType,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.grey[300],
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
                // Recommended Workouts List
                withPadding(
                  Column(
                    children: dummyRecommendedWorkouts.map((workout) {
                      return RecommendedWorkoutCard(workout: workout);
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
