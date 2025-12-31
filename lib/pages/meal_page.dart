import 'package:flutter/material.dart';
import 'package:my_fitness_app/widgets/bottom_navigation_bar.dart';
import 'package:my_fitness_app/widgets/gradient_background.dart';
import 'package:my_fitness_app/widgets/calories_remaining_card.dart';
import 'package:my_fitness_app/widgets/meal_card.dart';
import 'package:my_fitness_app/widgets/water_intake_card.dart';
import 'package:my_fitness_app/data/dummy/dummy_data.dart';
import 'package:my_fitness_app/utils/navigation_helper.dart';
import 'package:my_fitness_app/utils/padding_helper.dart';
import 'package:my_fitness_app/utils/meal_helpers.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int currentBottomNavIndex = 2; // Meals sayfası index 2

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
                      Icon(Icons.arrow_back, color: Colors.white),
                      Text(
                        'Meals',
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
                //const SizedBox(height: 30),
                withPadding(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "2025-12-30",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                withPadding(
                  CaloriesRemainingCard(
                    remaining: dummyTargets.dailyCalorieTarget -
                        dummyTodaySummary.caloriesConsumed,
                    total: dummyTargets.dailyCalorieTarget,
                    protein: dummyTodaySummary.proteinConsumedG,
                    carbs: dummyTodaySummary.carbsConsumedG,
                    fat: dummyTodaySummary.fatConsumedG,
                  ),
                ),
                // add food scan row
                withPadding(
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO: Handle add food
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF4A9EFF),
                                  Color(0xFF357ABD),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Add Food',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO: Handle scan
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromARGB(255, 30, 30, 35),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.qr_code_scanner,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Scan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // MEAL CARDS
                withPadding(
                  Column(
                    children: dummyMealLogs.entries.map((entry) {
                      final mealLog = entry.value;
                      return MealCard(
                        mealName: MealHelpers.getMealName(mealLog.mealType),
                        totalKcal: mealLog.totalKcal,
                        iconColor:
                            MealHelpers.getMealIconColor(mealLog.mealType),
                        icon: MealHelpers.getMealIcon(mealLog.mealType),
                        items: mealLog.items,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                // WATER INTAKE CARD
                withPadding(
                  WaterIntakeCard(
                    target: dummyTargets.waterTargetMl,
                    current: dummyTodaySummary.waterConsumedMl,
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
