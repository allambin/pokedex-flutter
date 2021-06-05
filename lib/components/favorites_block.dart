import 'package:flutter/material.dart';

import '../components/pokemon_card.dart';
import '../theme/styles.dart';

class FavoritesBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Favorites', style: ThemeText.header,),
            Column(
              children: [
                PokemonCard(),
                PokemonCard(),
                PokemonCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}