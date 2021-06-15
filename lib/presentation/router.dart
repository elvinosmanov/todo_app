import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/add_todo/add_todo_cubit.dart';
import 'package:todo_app/cubit/todos/todos_cubit.dart';

import '../data/repositories/repository.dart';
import '../data/services/network_service.dart';
import 'screens/add_todo_screen.dart';
import 'screens/edit_todo_screen.dart';
import 'screens/error_screen.dart';
import 'screens/todos_screen.dart';

class AppRouter {
  Repository repository = Repository(networkRepository: NetworkRepository());

  Route generate(RouteSettings settings) {
    switch (settings.name) {
      case TodosScreen.route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TodosCubit(repository: repository),
            child: TodosScreen(),
          ),
        );
      case EditTodoScreen.route:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case AddTodoScreen.route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddTodoCubit(),
            child: AddTodoScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }
}
