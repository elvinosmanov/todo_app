part of 'edit_todo_cubit.dart';

@immutable
abstract class EditTodoState {}

class EditTodoInitial extends EditTodoState {}

class EditTodoEdited extends EditTodoState {}

class EditTodoDeleteError extends EditTodoState {
  final String message;

  EditTodoDeleteError(this.message);
}

class EditTodoDeleting extends EditTodoState {}

class EditTodoUpdating extends EditTodoState {}

class EditTodoUpdateError extends EditTodoState {
  final String message;

  EditTodoUpdateError(this.message);
}
