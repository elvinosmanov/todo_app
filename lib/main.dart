import 'package:flutter/material.dart';
import 'presentation/screens/add_todo_screen.dart';
import 'presentation/router.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final route = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      onGenerateRoute: route.generate,
      home: AddTodoScreen(),
    );
  }
}
