import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/add_todo/add_todo_cubit.dart';
import 'package:todo_app/cubit/edit_todo/edit_todo_cubit.dart';
import 'package:todo_app/cubit/todos/todos_cubit.dart';
import 'package:todo_app/data/models/todo.dart';

import '../data/repositories/repository.dart';
import '../data/services/network_service.dart';
import 'screens/add_todo_screen.dart';
import 'screens/edit_todo_screen.dart';
import 'screens/error_screen.dart';
import 'screens/todos_screen.dart';

class AppRouter {
  late Repository repository;
  late TodosCubit todosCubit;

  AppRouter() {
    repository = Repository(networkRepository: NetworkRepository());
    todosCubit = TodosCubit(repository: repository);
  }
  Route generate(RouteSettings settings) {
    switch (settings.name) {
      case TodosScreen.route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<TodosCubit>.value(
            value: todosCubit,
            child: TodosScreen(),
          ),
        );
      case EditTodoScreen.route:
        final todo = settings.arguments as Todo;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                EditTodoCubit(repository: repository, todosCubit: todosCubit),
            child: EditTodoScreen(todo: todo,),
          ),
        );
      case AddTodoScreen.route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AddTodoCubit(repository: repository, todosCubit: todosCubit),
            child: AddTodoScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }
}
