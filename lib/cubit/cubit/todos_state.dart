part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodosCompleted extends TodosState {
  final List<Todo> todos;

  TodosCompleted({required this.todos});
}

class TodosLoading extends TodosState {}
