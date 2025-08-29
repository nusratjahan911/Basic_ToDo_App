import 'package:flutter/material.dart';

import 'home_page.dart';

///Create an app for manage your TODOS(daily activities)
///Todos - id, title, description, status(pending, inprogress, done), createdAt
///List will hold the todos
///new screen for create todos

void main(){
  runApp(TodoApp());
}
class TodoApp extends StatelessWidget{
  const TodoApp ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrangeAccent
      ),
    );
  }
}