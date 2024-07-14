import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
  });

  factory Todo.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Todo(
      id: doc.id,
      title: data['title'] ?? '',
      description: data.containsKey('description') ? data['description'] : null,
      isCompleted: data['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
