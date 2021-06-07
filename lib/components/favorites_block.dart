import 'package:flutter/material.dart';

import '../components/pokemon_card.dart';
import '../theme/styles.dart';

class FavoritesBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Favorites', style: ThemeText.header,),
          Column(
            children: [
              PokemonCard(),
              SizedBox(height: 20,),
              PokemonCard(),
              SizedBox(height: 20,),
              PokemonCard(),
            ],
          ),
        ],
      ),
    );
  }
}