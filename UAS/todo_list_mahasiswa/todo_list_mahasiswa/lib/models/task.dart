class Task {
  String id;
  String title;
  String category;
  DateTime deadline;
  bool isCompleted;
  String? imagePath;
  String? description;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.deadline,
    this.isCompleted = false,
    this.imagePath,
    this.description,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'deadline': deadline.millisecondsSinceEpoch,
      'isCompleted': isCompleted,
      'imagePath': imagePath,
      'description': description,
    };
  }

  //(Firebase data)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      category: map['category'] ?? '',
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] ?? 0),
      isCompleted: map['isCompleted'] ?? false,
      imagePath: map['imagePath'],
      description: map['description'],
    );
  }


  Task copyWith({
    String? id,
    String? title,
    String? category,
    DateTime? deadline,
    bool? isCompleted,
    String? imagePath,
    String? description,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      deadline: deadline ?? this.deadline,
      isCompleted: isCompleted ?? this.isCompleted,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
    );
  }
}

