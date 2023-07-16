import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<String> onChangeText;
  const CustomSearchBar({super.key, required this.onChangeText});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(40, 0, 0, 0),
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                widget.onChangeText(searchText);
              });
            },
          ),
        ),
        onChanged: (text) {
          setState(() {
            searchText = text;
          });
        });
  }
}
