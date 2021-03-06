import 'dart:convert';

class Todo {
  String? todoMessage;
  bool? isCompleted;
  int? id;
  Todo({
    this.todoMessage,
    this.isCompleted,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'todoMessage': todoMessage,
      'isCompleted': isCompleted,
      'id': id,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      todoMessage: map['todoMessage'],
      isCompleted: map['isCompleted'] == "true",
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());
}
