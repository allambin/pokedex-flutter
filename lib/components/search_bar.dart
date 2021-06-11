import 'package:flutter/material.dart';
import 'dart:async';

import '../views/pokemon_details_view.dart';
import '../services/pokemon_api.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  PokemonApi api = PokemonApi();
  Future<List<String>> _names;
  
  @override
  void initState() {
    super.initState();
    _names = api.fetchPokemonNames();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffdddddd),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: FutureBuilder<List<String>>(
          future: _names,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Autocomplete<String>(
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
                  return snapshot.data.where((element) => element.contains(value.text.toLowerCase()));
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: 160,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ListView.builder(
                            itemExtent: 30,
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
                onSelected: (name) {
                  Navigator.of(context).pushNamed(PokemonDetailsView.routeName, arguments: name);
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}