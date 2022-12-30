class LessonModel {
  final String createdAt;
  final String name;
  final int duration;
  final String category;
  final bool locked;
  final String id;

  LessonModel({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'name': name,
      'duration': duration,
      'category': category,
      'locked': locked,
      'id': id,
    };
  }

  factory LessonModel.fromJson(dynamic json) {
    return LessonModel(
      createdAt: json['createdAt'] ?? '',
      name: json['name'] ?? '',
      duration: json['duration'] ?? 0,
      category: json['category'] ?? '',
      locked: json['locked'] ?? false,
      id: json['id'] ?? '',
    );
  }
}
