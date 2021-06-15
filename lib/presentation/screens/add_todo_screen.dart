import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  static const route = "/add_todo";
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter todo message..."),
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(child: _addBtn(context))
        ],
      ),
    );
  }

  Widget _addBtn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Center(
        child: Text(
          'Add Todo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
