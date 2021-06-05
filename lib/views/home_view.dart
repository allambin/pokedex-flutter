import 'package:flutter/material.dart';

import '../components/favorites_block.dart';
import '../components/search_block.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: AssetImage('assets/images/pokeball.png'),
                  // fit: BoxFit.fill,
                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                ),
                top: -100,
              ),
              SearchBlock(),
            ],
          ),
          FavoritesBlock(),
        ],
      ),
    );
  }
}