import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/todo.dart';
import '../../data/repositories/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Repository repository;
  TodosCubit({required this.repository}) : super(TodosInitial());
  Future<void> fetchTodos() async {
    emit(TodosLoading());
    await Future.delayed(Duration(seconds: 1));
    repository.fetchTodos().then(
      (todos) {
        if (todos.isEmpty) {
          emit(TodosEmpty());
          return;
        }
        emit(
          TodosCompleted(todos: todos),
        );
      },
    ).catchError(
      (onError) {
        emit(TodosError(onError.toString()));
      },
    );
  }

  void changeCompletion(Todo todo) {
    repository.changeCompletion(!todo.isCompleted!, todo.id).then((isChanged) {
      return {
        if (isChanged) {todo.isCompleted = !todo.isCompleted!, updateTodoList()}
      };
    });
  }

  updateTodoList() {
    final currentState = state;
    if (currentState is TodosCompleted) {
      emit(TodosCompleted(todos: currentState.todos));
    }
  }

  void addTodo(Todo todo) {
    final currentState = state;
    if (currentState is TodosCompleted) {
      final todos = currentState.todos;
      todos.add(todo);
      emit(TodosCompleted(todos: todos));
    }
  }

  void deleteTodo(Todo todo) {
    final currentState = state;
    if (currentState is TodosCompleted) {
      final todos = currentState.todos;
      todos.remove(todo);
      emit(TodosCompleted(todos: todos));
    }
  }
}
