import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
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
            // Add functionality to clear text input here
          },
        ),
      ),
      onChanged: (value) {
        // Add functionality for text input change here
      },
    );
  }
}
