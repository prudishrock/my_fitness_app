class WorkoutProgram {
  final String id;
  final String title;
  final String status; // ACTIVE / PAUSED
  final int progressPercent; // 0-100
  final List<String> tags;
  final int daysPerWeek;
  final int durationMins;
  final String? backgroundImageAsset;

  const WorkoutProgram({
    required this.id,
    required this.title,
    required this.status,
    required this.progressPercent,
    required this.tags,
    required this.daysPerWeek,
    required this.durationMins,
    this.backgroundImageAsset,
  });
}
