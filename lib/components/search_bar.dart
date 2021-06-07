import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  static const List<String> _names = <String>[
    'pikachu',
    'charmander',
    'bulbasaur',
    'ivysaur',
    'venusaur',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffdddddd),
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
                prefixIcon: Icon(Icons.search, color: Colors.grey[600],),
              ),
              style: TextStyle(fontSize: 18),
              // onEditingComplete: ,
            );
          },
          optionsBuilder: (TextEditingValue value) {
            if (value.text == '') {
              return const Iterable<String>.empty();
            }
            return _names.where((element) => element.contains(value.text.toLowerCase()));
          },
          optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListView.builder(
                      itemExtent: 40,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () => onSelected(option),
                            child: Text(option, style: TextStyle(fontSize: 18),)
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}