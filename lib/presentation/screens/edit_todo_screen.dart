import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo.dart';

class EditTodoScreen extends StatelessWidget {
  static const route = "/edit_todo";
  final Todo todo;
  const EditTodoScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(todo.todoMessage.toString()),
      ),
    );
  }
}
