import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '../services/pokemon_api.dart';
// import '../providers/pokemon_provider.dart';

class PokemonDetailsView extends StatefulWidget {
  static const routeName = '/pokemon-details';

  @override
  _PokemonDetailsViewState createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  PokemonApi api = PokemonApi();
  var _isLoading = false;
  var _currentPokemon;
  
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(Duration.zero, () async {
      final pokemonName = ModalRoute.of(context).settings.arguments;
      var pokemon = await api.fetchCurrentPokemon(pokemonName);
      setState(() {
        _currentPokemon = pokemon;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Center(
        child: _isLoading ? CircularProgressIndicator() : Text(_currentPokemon.name),
      ),
    );
  }
}