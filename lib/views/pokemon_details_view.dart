import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../components/pokemon_details_body.dart';
import '../components/pokemon_details_header.dart';
import '../services/pokemon_api.dart';

class PokemonDetailsView extends StatefulWidget {
  static const routeName = '/pokemon-details';
  final pokemonName;

  const PokemonDetailsView(this.pokemonName);

  @override
  _PokemonDetailsViewState createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  final PokemonApi api = PokemonApi();
  Future<Pokemon> _pokemon;

  @override
  void initState() {
    super.initState();
    _pokemon = PokemonApi().fetchCurrentPokemon(widget.pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: (){}),
        ],
      ),
      backgroundColor: Colors.blue[400],
      body: FutureBuilder(
        future: _pokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                PokemonDetailsHeader(snapshot.data),
                Expanded(child: PokemonDetailsBody(snapshot.data)),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}