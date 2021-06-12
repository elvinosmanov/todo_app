import 'package:flutter/material.dart';
import 'package:todo_app/presentation/router.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final route = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      onGenerateRoute: route.generate,
    );
  }
}
