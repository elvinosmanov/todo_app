import 'package:flutter/material.dart';
import 'package:todo_app/cubit/edit_todo/edit_todo_cubit.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTodoScreen extends StatelessWidget {
  static const route = "/edit_todo";
  final Todo todo;
  final _controller = TextEditingController();
  EditTodoScreen({required this.todo}) {
    _controller.text = todo.todoMessage ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTodoCubit, EditTodoState>(
      listener: (context, state) {
        if (state is EditTodoEdited) {
          Navigator.pop(context);
        } else if (state is EditTodoDeleteError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: Duration(milliseconds: 500),
            ),
          );
        } else if (state is EditTodoUpdateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: Duration(milliseconds: 500),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                context.read<EditTodoCubit>().deleteTodo(todo);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),
            )
          ],
          title: Text('Edit Todo'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: "Enter todo message..."),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  context
                      .read<EditTodoCubit>()
                      .updateTodo(todo, _controller.text);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: BlocBuilder<EditTodoCubit, EditTodoState>(
                      builder: (context, state) {
                        if (state is EditTodoUpdating) {
                          return CircularProgressIndicator();
                        }
                        return Text(
                          'Update Todo',
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
