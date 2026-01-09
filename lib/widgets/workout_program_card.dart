import 'package:flutter/material.dart';
import 'package:my_fitness_app/models/workout_program.dart';

class WorkoutProgramCard extends StatelessWidget {
  final WorkoutProgram program;

  const WorkoutProgramCard({
    super.key,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.75;

    return InkWell(
      onTap: () {
        // TODO: Open program detail
      },
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: cardWidth,
        height: 220,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1B2633),
              Color(0xFF0F1720),
              Color(0xFF0A0F16),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
          border: Border.all(
            color: Colors.cyanAccent.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Status Chip and Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: program.status == 'ACTIVE'
                        ? Colors.cyanAccent.withOpacity(0.2)
                        : Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: program.status == 'ACTIVE'
                          ? Colors.cyanAccent.withOpacity(0.4)
                          : Colors.grey.withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    program.status,
                    style: TextStyle(
                      color: program.status == 'ACTIVE'
                          ? Colors.cyanAccent
                          : Colors.grey[400],
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                // Progress Indicator (only for ACTIVE)
                if (program.status == 'ACTIVE')
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: CircularProgressIndicator(
                            value: program.progressPercent / 100,
                            strokeWidth: 4,
                            backgroundColor: Colors.grey[800],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.cyanAccent,
                            ),
                          ),
                        ),
                        Text(
                          '${program.progressPercent}%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const Spacer(),
            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: program.tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              program.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // Meta info
            Text(
              '${program.daysPerWeek} days/week • ${program.durationMins} mins',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
