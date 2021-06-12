import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  static const route = "/add_todo";
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo Screen'),
      ),
      body: Center(
        child: Text('ADD TODO SCREEN'),
      ),
    );
  }
}
