import 'package:flutter/material.dart';

import './views/home_view.dart';
import './views/pokemon_details_view.dart';
// import './views/pokemon_search_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      home: HomeView(),
      routes: {
        PokemonDetailsView.routeName: (ctx) => PokemonDetailsView()
      },
    );
  }
}