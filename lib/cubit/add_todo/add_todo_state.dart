part of 'add_todo_cubit.dart';

@immutable
abstract class AddTodoState {}

class AddTodoInitial extends AddTodoState {}

class AddTodoError extends AddTodoState {
  final String message;

  AddTodoError(this.message);
}

class AddingTodo extends AddTodoState {}

class TodoAdded extends AddTodoState {}
