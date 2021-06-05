import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokemon_api.dart';

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
      // final pokemonName = ModalRoute.of(context).settings.arguments;
      // var pokemon = await api.fetchCurrentPokemon(pokemonName);
      var pokemon = new Pokemon(name: 'pikachu', height: 0.8, weight: 60.0, types: []);
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
      backgroundColor: Colors.blue[400],
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Pikachu'),
                  Text('Description'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${_currentPokemon.height}m'),
                          VerticalDivider(thickness: 2, color: Colors.blueGrey[100],),
                          Text('Types'),
                          VerticalDivider(thickness: 2, color: Colors.blueGrey[100]),
                          Text('${_currentPokemon.weight}kg')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Type chart'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('No damage'),
                            Text('Dark'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('/2 damage'),
                            Text('Dark'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('*2 damage'),
                            Text('Dark'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}