import 'package:flutter/material.dart';

class GoalsTargetsCard extends StatelessWidget {
  final String currentGoalLabel;
  final int proteinG;
  final int carbsG;
  final int fatG;
  final double waterL;
  final VoidCallback? onEdit;

  const GoalsTargetsCard({
    super.key,
    required this.currentGoalLabel,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.waterL,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 24.0;
    const double cardPadding = 20.0;
    const double pillSpacing = 12.0;

    return Container(
      padding: const EdgeInsets.all(cardPadding),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Icon + Title + Edit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.flag,
                    size: 18,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Goals & Targets',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: onEdit ??
                    () {
                      // TODO: Edit goals
                    },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Current Goal Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Goal',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 13,
                ),
              ),
              Text(
                currentGoalLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Target Pills Row
          Row(
            children: [
              Expanded(
                child: TargetPill(
                  label: 'PROT',
                  value: '${proteinG}g',
                ),
              ),
              SizedBox(width: pillSpacing),
              Expanded(
                child: TargetPill(
                  label: 'CARB',
                  value: '${carbsG}g',
                ),
              ),
              SizedBox(width: pillSpacing),
              Expanded(
                child: TargetPill(
                  label: 'FAT',
                  value: '${fatG}g',
                ),
              ),
              SizedBox(width: pillSpacing),
              Expanded(
                child: TargetPill(
                  label: 'H2O',
                  value: '${waterL}L',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TargetPill extends StatelessWidget {
  final String label;
  final String value;

  const TargetPill({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
