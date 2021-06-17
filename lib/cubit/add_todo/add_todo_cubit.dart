import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/cubit/todos/todos_cubit.dart';
import 'package:todo_app/data/repositories/repository.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final TodosCubit todosCubit;
  final Repository repository;
  AddTodoCubit({required this.todosCubit, required this.repository})
      : super(AddTodoInitial());

  void addTodo(String message) {
    if (message.isEmpty) {
      emit(AddTodoError("Todo message is empty"));
      return;
    }
    emit(AddingTodo());

    Timer(Duration(seconds: 1), () {
      repository.addTodo(message).then((todo) {
        if (todo != null) {
          todosCubit.addTodo(todo);
          emit(TodoAdded());
        }
      });
    });
  }
}
