import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const route = "/error";

  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Page could not found',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
