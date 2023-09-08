import 'package:flutter/material.dart';
import 'package:utility_plus/feature/todo/components/todo_card.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todos = [
    {
      'title': "Todo 1",
      'description':
          'This is description for todo 1. This is a large description. And now it is more larger description.'
    },
    {'title': "Todo 2", 'description': 'This is description for todo 2'},
    {'title': "Todo 3", 'description': 'This is description for todo 3'},
    {'title': "Todo 4", 'description': 'This is description for todo 4'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
    {'title': "Todo 5", 'description': 'This is description for todo 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          final title = todo['title'] ?? 'No Title';
          final description = todo['description'] ?? 'No Description';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: TodoCard(
              title: title,
              description: description,
            ),
            // Card(
            //   child: ListTile(
            //     onTap: () {
            //       print(title);
            //     },
            //     title: Text(title),
            //     subtitle: Text(description),
            //     leading: const Icon(Icons.list_alt),
            //     trailing: Icon(Icons.delete),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
