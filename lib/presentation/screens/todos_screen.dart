import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/add_todo_screen.dart';

class TodosScreen extends StatelessWidget {
  static const route = "/";

  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(AddTodoScreen.route),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Center(
        child: Text('TODOS SCREEN'),
      ),
    );
  }
}
