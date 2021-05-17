import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/pokemon_list.dart';
import './views/pokemon_details_view.dart';
import './views/pokemon_search_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonList>(
      create: (_) => PokemonList(),
      child: MaterialApp(
        title: 'Pokedex',
        home: PokemonSearchView(),
        routes: {
          PokemonDetailsView.routeName: (ctx) => PokemonDetailsView()
        },
      ),
    );
  }
}