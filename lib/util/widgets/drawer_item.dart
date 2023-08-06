import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  final String title;
  const DrawerItem({super.key, required this.title});

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 52, 11, 122),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
