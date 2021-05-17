import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pokemon_details_view.dart';
import '../providers/pokemon.dart';
import '../providers/pokemon_list.dart';

class PokemonSearchView extends StatefulWidget {
  static const routeName = '/pokemon-search';

  @override
  _PokemonSearchViewState createState() => _PokemonSearchViewState();
}

class _PokemonSearchViewState extends State<PokemonSearchView> {
  var _isFirstRun = true;

  @override
  void didChangeDependencies() {
    if (_isFirstRun) {
      print('didChangeDependencies');
      Provider.of<PokemonList>(context).fetchPokemonNames().then((value) => print('success')).catchError((error) => print(error));
      _isFirstRun = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> _pokemons = Provider.of<PokemonList>(context).pokemons;
    final List<String> _kNames = _pokemons.map((e) => e.name).toList();

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
                  return _kNames.where((element) => element.contains(value.text.toLowerCase()));
                },
                onSelected: (selected) => Navigator.of(context).pushNamed(PokemonDetailsView.routeName)
              ),
            ],
          ),
        ),
      ),
    );
  }
}