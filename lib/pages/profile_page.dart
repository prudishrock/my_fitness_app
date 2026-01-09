import 'package:flutter/material.dart';
import 'package:my_fitness_app/utils/padding_helper.dart';
import 'package:my_fitness_app/widgets/gradient_background.dart';
import 'package:my_fitness_app/widgets/bottom_navigation_bar.dart';
import 'package:my_fitness_app/utils/navigation_helper.dart';
import 'package:my_fitness_app/widgets/profile_header_card.dart';
import 'package:my_fitness_app/widgets/profile_stats_grid.dart';
import 'package:my_fitness_app/widgets/goals_targets_card.dart';
import 'package:my_fitness_app/widgets/preferences_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentBottomNavIndex = 3; // Profile page index 3

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
                      InkWell(
                        onTap: () {
                          NavigationHelper.navigateToHome(context);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(Icons.person, color: Colors.white),
                    ],
                  ),
                ),
                withPadding(
                  ProfileHeaderCard(
                    name: 'LOLKAN',
                    handle: '@alex_strength',
                    goalLabel: 'GAIN MUSCLE',
                    levelLabel: 'ADVANCED',
                    isVerified: true,
                    onEditPressed: () {
                      // TODO: Edit profile
                    },
                  ),
                ),
                const SizedBox(height: 8),
                withPadding(
                  ProfileStatsGrid(
                    weightKg: 82.5,
                    bodyFatPercent: 12.4,
                    workoutsPerWeek: 5,
                    targetKcal: 2850,
                  ),
                ),
                const SizedBox(height: 18),
                // Goals & Targets Card
                withPadding(
                  GoalsTargetsCard(
                    currentGoalLabel: 'Hypertrophy (Lean)',
                    proteinG: 210,
                    carbsG: 320,
                    fatG: 75,
                    waterL: 3.5,
                    onEdit: () {
                      // TODO: Edit goals
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Preferences Card
                withPadding(
                  const PreferencesCard(),
                ),
                const SizedBox(height: 20),
                // Sign Out Button
                withPadding(
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Sign out
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.05),
                      ),
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Delete Account
                Center(
                  child: TextButton(
                    onPressed: () {
                      // TODO: Delete account
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
