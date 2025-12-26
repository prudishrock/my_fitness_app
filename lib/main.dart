import 'package:flutter/material.dart';
import 'package:my_fitness_app/widgets/macro_card.dart';
import 'package:my_fitness_app/widgets/exercise_card.dart';
import 'package:my_fitness_app/widgets/calorie_progress_card.dart';

void main() {
  runApp(const MyFitnessApp());
}

class MyFitnessApp extends StatefulWidget {
  const MyFitnessApp({super.key});

  @override
  State<MyFitnessApp> createState() => _MyFitnessAppState();
}

class _MyFitnessAppState extends State<MyFitnessApp> {
  String selectedFilter = 'All';
  final List<String> filters = ['All', 'Chest', 'Back', 'Legs', 'Core'];
  int currentBottomNavIndex = 0;

  Widget _withPadding(Widget child, {bool horizontalOnly = false}) {
    return Padding(
      padding: horizontalOnly
          ? const EdgeInsets.symmetric(horizontal: 20.0)
          : const EdgeInsets.all(20.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: myBottomNavigationBar(
          currentIndex: currentBottomNavIndex,
          onTap: (index) {
            setState(() {
              currentBottomNavIndex = index;
            });
          },
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF3A1C5A),
                Color.fromARGB(255, 24, 12, 36),
                Color.fromARGB(255, 7, 7, 11),
              ],
              stops: [0.0, 0.45, 0.9],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _withPadding(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person, color: Colors.white),
                        Column(
                          children: [
                            Text(
                              "Hello Alex,",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Let's get fit!",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        Icon(Icons.notifications, color: Colors.white),
                      ],
                    ),
                  ),

                  CalorieProgressCard(
                    consumed: 1450,
                    goal: 2200,
                  ),
                  SizedBox(height: 20),

                  //MACRO CARDS
                  _withPadding(
                    Row(
                      children: [
                        Expanded(
                          child: MacroCard(
                            title: 'PROTEIN',
                            value: '110 g',
                            color: Colors.purpleAccent,
                            icon: Icons.science,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MacroCard(
                            title: 'CARBS',
                            value: '210 g',
                            color: Colors.cyanAccent,
                            icon: Icons.bar_chart,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MacroCard(
                            title: 'FAT',
                            value: '55 g',
                            color: Colors.pinkAccent,
                            icon: Icons.water_drop,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  //LOG MEAL INTAKE
                  _withPadding(
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

                  _withPadding(
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
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.white,
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
                  _withPadding(
                    Column(
                      children: [
                        ExerciseCard(
                          title: 'Tech-Bar Bench Press',
                          subtitle: 'Pectorals Major',
                          imageUrl:
                              'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
                          difficulty: Difficulty.hard,
                          sets: 3,
                          reps: 12,
                          onTap: () {
                            // TODO: Navigate to exercise detail
                          },
                        ),
                        ExerciseCard(
                          title: 'Cable Flys',
                          subtitle: 'Inner Chest',
                          imageUrl:
                              'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400',
                          difficulty: Difficulty.medium,
                          sets: 4,
                          reps: 15,
                          onTap: () {
                            // TODO: Navigate to exercise detail
                          },
                        ),
                        ExerciseCard(
                          title: 'Neural Deadlift',
                          subtitle: 'Posterior Chain',
                          imageUrl:
                              'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400',
                          difficulty: Difficulty.extreme,
                          sets: 5,
                          reps: 5,
                          onTap: () {
                            // TODO: Navigate to exercise detail
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class myBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const myBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: const Color.fromARGB(255, 18, 18, 22),
      selectedItemColor: Colors.cyanAccent,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), label: 'Excercises'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Meals'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
