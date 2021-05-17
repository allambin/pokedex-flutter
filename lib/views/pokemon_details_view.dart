import 'package:flutter/material.dart';

class PokemonDetailsView extends StatelessWidget {
  static const routeName = '/pokemon-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Center(
        child: Text('Pokemon'),
      ),
    );
  }
}