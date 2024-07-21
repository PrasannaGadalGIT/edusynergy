class User {
  final String id;
  final String name;
  final int points; // Ensure this is non-nullable

  User({
    required this.id,
    required this.name,
    required this.points,
  });
}
