import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String title;
  final String description;
  const TodoCard({super.key, required this.title, required this.description});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 209, 130, 255), Colors.deepPurple],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Icon(
              Icons.list_alt_outlined,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.description),
              ],
            ),
          ),
          const Expanded(
            child: Icon(
              Icons.delete,
              size: 30,
              color: Color.fromARGB(160, 225, 35, 21),
            ),
          ),
        ],
      ),
    );
  }
}
