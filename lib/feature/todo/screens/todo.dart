import 'package:flutter/material.dart';
import 'package:utility_plus/feature/todo/components/toto_list.dart';
import 'package:utility_plus/util/buttons/primary_button.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 220, 255, 1),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: TodoList(),
            ),
            const PrimaryButton(),
          ],
        ),
      ),
    );
  }
}
