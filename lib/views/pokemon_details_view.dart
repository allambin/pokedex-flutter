import 'package:flutter/material.dart';

import '../components/pokemon_details_body.dart';
import '../components/pokemon_details_header.dart';

class PokemonDetailsView extends StatelessWidget {
  static const routeName = '/pokemon-details';

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
      body: Column(
        children: [
          PokemonDetailsHeader(),
          Expanded(child: PokemonDetailsBody()),
        ],
      ),
    );
  }
}