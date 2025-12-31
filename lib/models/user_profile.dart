enum Goal {
  loseFat,
  maintain,
  gain,
}

enum TrainingLevel {
  beginner,
  intermediate,
  advanced,
}

class UserProfile {
  final String id;
  final String name;
  final String? avatarUrl;
  final Goal goal;
  final TrainingLevel trainingLevel;

  const UserProfile({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.goal,
    required this.trainingLevel,
  });
}
