import 'package:flutter/material.dart';

import '../theme/styles.dart';
import 'search_bar.dart';

class SearchBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pokedex', style: ThemeText.header,),
          Text('Search for a Pokemon by name', style: ThemeText.subTitle,),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SearchBar(),
          ),
        ],
      ),
    );
  }
}