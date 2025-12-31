class NutritionDaySummary {
  final DateTime date;
  final int caloriesConsumed;
  final int proteinConsumedG;
  final int carbsConsumedG;
  final int fatConsumedG;
  final int waterConsumedMl;

  const NutritionDaySummary({
    required this.date,
    required this.caloriesConsumed,
    required this.proteinConsumedG,
    required this.carbsConsumedG,
    required this.fatConsumedG,
    required this.waterConsumedMl,
  });
}
