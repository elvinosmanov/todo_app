import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo.dart';
import '../../cubit/cubit/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              context.read<TodosCubit>().fetchTodos();
              // Navigator.of(context).pushNamed(AddTodoScreen.route);
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
          }

          final todos = (state as TodosCompleted).todos;
          return SingleChildScrollView(
            child: Column(
                children: todos.map((todo) => _todo(context, todo)).toList()),
          );
        },
      ),
    );
  }

  Widget _todo(BuildContext context, Todo todo) {
    return Dismissible(key: Key("${todo.id}"), child: _todoTile(context, todo));
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
