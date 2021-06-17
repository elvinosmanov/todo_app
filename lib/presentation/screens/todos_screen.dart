import 'package:flutter/material.dart';
import '../../cubit/todos/todos_cubit.dart';
import 'edit_todo_screen.dart';
import '../../data/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_screen.dart';

class TodosScreen extends StatelessWidget {
  static const route = "/";

  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TodosCubit>().fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AddTodoScreen.route);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TodosCompleted) {
            final todos = state.todos;
            return SingleChildScrollView(
              child: Column(
                  children: todos.map((todo) => _todo(context, todo)).toList()),
            );
          } else if (state is TodosError) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }
          return Center(
            child: Text(
              'There is no any todo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  Widget _todo(BuildContext context, Todo todo) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditTodoScreen.route, arguments: todo);
      },
      child: Dismissible(
          key: Key("${todo.id}"),
          confirmDismiss: (_) {
            context.read<TodosCubit>().changeCompletion(todo);
            return Future.value(false);
          },
          child: _todoTile(context, todo)),
    );
  }

  Container _todoTile(BuildContext context, Todo todo) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              todo.todoMessage.toString(),
            ),
            _completionIndicator(todo),
          ],
        ));
  }

  Widget _completionIndicator(Todo todo) {
    return Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 4.0, color: todo.isCompleted! ? Colors.green : Colors.red),
        ));
  }
}
