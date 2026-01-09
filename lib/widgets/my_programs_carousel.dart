import 'package:flutter/material.dart';
import 'package:my_fitness_app/models/workout_program.dart';
import 'package:my_fitness_app/widgets/workout_program_card.dart';

class MyProgramsCarousel extends StatelessWidget {
  final List<WorkoutProgram> programs;

  const MyProgramsCarousel({
    super.key,
    required this.programs,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: programs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return WorkoutProgramCard(program: programs[index]);
        },
      ),
    );
  }
}
