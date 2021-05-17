import 'package:flutter/material.dart';

class PokemonSearchView extends StatelessWidget {
  static const routeName = '/pokemon-search';

  static const List<String> _kOptions = <String>[
    'Bulbasaur',
    'Tortoise',
    'Raticate',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('assets/images/pokedex.png'),
              SizedBox(
                height: 20,
              ),
              Text('Search a Pokemon'),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue value) {
                  if (value.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _kOptions.where((element) => element.contains(value.text.toLowerCase()));
                },
                onSelected: (selected) => print(selected),
              ),
            ],
          ),
        ),
      ),
    );
  }
}