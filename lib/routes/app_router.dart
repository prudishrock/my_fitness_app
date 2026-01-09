import 'package:go_router/go_router.dart';
import 'package:my_fitness_app/pages/main_page.dart';
import 'package:my_fitness_app/pages/workout_page.dart';
import 'package:my_fitness_app/pages/meal_page.dart';
import 'package:my_fitness_app/pages/profile_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/workout',
        name: 'workout',
        builder: (context, state) => const WorkoutPage(),
      ),
      GoRoute(
        path: '/meals',
        name: 'meals',
        builder: (context, state) => const MealPage(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}
