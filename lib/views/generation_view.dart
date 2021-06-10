import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/theme/styles.dart';

class GenerationView extends StatelessWidget {
  static const routeName = '/generations/{num}'; //todo fix

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 30),
            child: Text('Generation I', style: ThemeText.header,),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: PokemonCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}