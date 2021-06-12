import 'package:flutter/material.dart';

class EditTodoScreen extends StatelessWidget {
  static const route = "/edit_todo";

  const EditTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Edit Todo Screen'),
      ),
    );
  }
}
