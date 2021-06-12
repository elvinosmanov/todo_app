import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_app/presentation/screens/edit_todo_screen.dart';
import 'package:todo_app/presentation/screens/error_screen.dart';
import 'package:todo_app/presentation/screens/todos_screen.dart';

class AppRouter {
  Route generate(RouteSettings settings) {
    switch (settings.name) {
      case TodosScreen.route:
        return MaterialPageRoute(builder: (_) => TodosScreen());
      case EditTodoScreen.route:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case AddTodoScreen.route:
        return MaterialPageRoute(builder: (_) => AddTodoScreen());
      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }
}
