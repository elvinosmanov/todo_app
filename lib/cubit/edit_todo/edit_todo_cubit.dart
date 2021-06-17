import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/cubit/todos/todos_cubit.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/data/repositories/repository.dart';

part 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  final Repository repository;
  final TodosCubit todosCubit;
  EditTodoCubit({required this.repository, required this.todosCubit})
      : super(EditTodoInitial());

  void deleteTodo(Todo todo) {
    final int? id = todo.id;
    emit(EditTodoDeleting());
    repository.deleteTodo(id).then(
      (isDeleted) {
        if (isDeleted) {
          todosCubit.deleteTodo(todo);
          emit(EditTodoEdited());
        } else {
          emit(EditTodoDeleteError("Todo could not delete..."));
        }
      },
    );
  }

  void updateTodo(Todo todo, String message) {
    if (message.isEmpty) {
      emit(EditTodoUpdateError("Message is Empty"));
      return;
    }
    emit(EditTodoUpdating());
    repository.updateTodo(message, todo.id).then((isUpdated) {
      if (isUpdated) {
        todo.todoMessage = message;
        todosCubit.updateTodoList();
        emit(EditTodoEdited());
      } else {
        emit(EditTodoUpdateError("Todo could not update..."));
      }
    });
  }
}
