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
              Positioned(
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  child: Image(
                    image: AssetImage('assets/images/pokeball.png'),
                    fit: BoxFit.fill,
                    color: const Color.fromRGBO(0, 0, 0, 0.09),
                  ),
                ),
                top: -200,
                left: 0,
                right: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 30),
                child: SearchBlock(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: FavoritesBlock(),
          ),
        ],
      ),
    );
  }
}