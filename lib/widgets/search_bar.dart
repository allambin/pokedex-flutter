import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final _names = ['Bulbasaur, Ivysaur, Florisaur'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue value) {
          if (value.text == '') {
            return const Iterable<String>.empty();
          }
          return _names.where((element) => element.contains(value.text.toLowerCase()));
        },
        onSelected: (selected) => {},
      ),
    );
  }
}