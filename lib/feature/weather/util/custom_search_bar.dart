import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<String> onChangeText;
  const CustomSearchBar({super.key, required this.onChangeText});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return TextField(
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(40, 120, 197, 255),
        hintText: 'Search...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              widget.onChangeText(textEditingController.text);
            });
          },
        ),
      ),
      onEditingComplete: () {
        setState(() {
          widget.onChangeText(textEditingController.text);
        });
      },
    );
  }
}
