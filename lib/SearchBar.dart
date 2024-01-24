import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 20,
      width: 200,
      
      child: Row(
        children: [
          // Icon(loop),
          TextField(
          controller: _controller,
          style: TextStyle(
            color: Colors.red,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          onSubmitted: (value) {
            // Обработка введенного текста
          },
          ),
        ],
      ),
    );
  }
}
