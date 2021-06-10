import 'package:flutter/material.dart';

import './views/generation_view.dart';
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
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(
            fontSize: 20,
          ),
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeView(),
      routes: {
        PokemonDetailsView.routeName: (ctx) => PokemonDetailsView(),
        GenerationView.routeName: (ctx) => GenerationView(),
      },
    );
  }
}