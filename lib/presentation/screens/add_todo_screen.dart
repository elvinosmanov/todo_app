import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/add_todo/add_todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  static const route = "/add_todo";
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: BlocListener<AddTodoCubit, AddTodoState>(
        listener: (context, state) {
          if (state is TodoAdded) {
            Navigator.pop(context);
          }
        },
        child: Container(padding: EdgeInsets.all(10.0), child: _body(context)),
      ),
    );
  }

  Column _body(BuildContext context) {
    return Column(
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
              final message = _controller.text;
              context.read<AddTodoCubit>().addTodo(message.trim());
            },
            child: _addBtn(context))
      ],
    );
  }

  Widget _addBtn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Center(
        child: BlocBuilder<AddTodoCubit, AddTodoState>(
          builder: (context, state) {
            if (state is AddingTodo) {
              return CircularProgressIndicator();
            }
            return Text(
              'Add Todo',
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
