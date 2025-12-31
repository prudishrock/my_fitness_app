enum MealType {
  breakfast,
  lunch,
  dinner,
  snacks,
}

class MealItem {
  final String id;
  final String name;
  final String servingText;
  final int kcal;
  final int? proteinG;
  final int? carbsG;
  final int? fatG;

  const MealItem({
    required this.id,
    required this.name,
    required this.servingText,
    required this.kcal,
    this.proteinG,
    this.carbsG,
    this.fatG,
  });
}

class MealLog {
  final MealType mealType;
  final List<MealItem> items;

  const MealLog({
    required this.mealType,
    required this.items,
  });

  int get totalKcal => items.fold(0, (sum, item) => sum + item.kcal);

  int get totalProteinG => items.fold(
        0,
        (sum, item) => sum + (item.proteinG ?? 0),
      );

  int get totalCarbsG => items.fold(
        0,
        (sum, item) => sum + (item.carbsG ?? 0),
      );

  int get totalFatG => items.fold(
        0,
        (sum, item) => sum + (item.fatG ?? 0),
      );
}
