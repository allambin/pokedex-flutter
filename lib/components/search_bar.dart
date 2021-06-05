import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  static const List<String> _names = <String>[
    'pikachu',
    'charmander',
    'bulbasaur',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Autocomplete<String>(
          fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
            return TextField(
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
              ),
            );
          },
          optionsBuilder: (TextEditingValue value) {
            if (value.text == '') {
              return const Iterable<String>.empty();
            }
            return _names.where((element) => element.contains(value.text.toLowerCase()));
          },
        ),
      ),
    );
  }
}