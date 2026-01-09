import 'package:flutter/material.dart';

class ProfileStatsGrid extends StatelessWidget {
  final double weightKg;
  final double bodyFatPercent;
  final int workoutsPerWeek;
  final int targetKcal;

  const ProfileStatsGrid({
    super.key,
    required this.weightKg,
    required this.bodyFatPercent,
    required this.workoutsPerWeek,
    required this.targetKcal,
  });

  @override
  Widget build(BuildContext context) {
    const double cardSpacing = 14.0;
    const double borderRadius = 24.0;
    const double cardPadding = 16.0;

    return Column(
      children: [
        // First Row: Weight & Body Fat
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: 'WEIGHT',
                value: weightKg.toStringAsFixed(1),
                unit: 'kg',
                icon: Icons.monitor_weight,
                borderRadius: borderRadius,
                padding: cardPadding,
              ),
            ),
            SizedBox(width: cardSpacing),
            Expanded(
              child: StatCard(
                label: 'BODY FAT',
                value: bodyFatPercent.toStringAsFixed(1),
                unit: '%',
                icon: Icons.person,
                borderRadius: borderRadius,
                padding: cardPadding,
              ),
            ),
          ],
        ),
        SizedBox(height: cardSpacing),
        // Second Row: Workouts & Target
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: 'WORKOUTS',
                value: workoutsPerWeek.toString(),
                unit: '/ week',
                icon: Icons.fitness_center,
                borderRadius: borderRadius,
                padding: cardPadding,
              ),
            ),
            SizedBox(width: cardSpacing),
            Expanded(
              child: StatCard(
                label: 'TARGET',
                value: targetKcal.toString(),
                unit: 'kcal',
                icon: Icons.local_fire_department,
                borderRadius: borderRadius,
                padding: cardPadding,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final double borderRadius;
  final double padding;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.borderRadius,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1B2633),
            Color(0xFF0F1720),
            Color(0xFF0A0F16),
          ],
          stops: [0.0, 0.45, 1.0],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top: Icon + Label
          Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: Colors.white.withOpacity(0.6),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Bottom: Value + Unit
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  unit,
                  style: TextStyle(
                    color: Colors.cyanAccent.withOpacity(0.8),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
