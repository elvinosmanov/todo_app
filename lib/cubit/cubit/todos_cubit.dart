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
    await Future.delayed(Duration(seconds: 1 ));
    repository.fetchTodos().then((todos) => emit(TodosCompleted(todos: todos)));
  }
}
