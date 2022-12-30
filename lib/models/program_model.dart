class ProgramModel {
  final String createdAt;
  final String name;
  final String category;
  final int lesson;
  final String id;

  ProgramModel({
    required this.createdAt,
    required this.name,
    required this.category,
    required this.lesson,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'name': name,
      'category': category,
      'lesson': lesson,
      'id': id,
    };
  }

  factory ProgramModel.fromJson(dynamic json) {
    return ProgramModel(
      createdAt: json['createdAt'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      lesson: json['lesson'] ?? 0,
      id: json['id'] ?? '',
    );
  }
}
