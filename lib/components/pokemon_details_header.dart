import 'package:flutter/material.dart';

import '../utils/string_extension.dart';
import '../models/pokemon.dart';

class PokemonDetailsHeader extends StatelessWidget {
  final Pokemon _pokemon;

  const PokemonDetailsHeader(this._pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(_pokemon.name.capitalize(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: _pokemon.types.map((e) => e.icon).toList(),
                            ),
                          ),
                        ],
                      ),
                      Text('#${_pokemon.number}', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Text(_pokemon.genus, style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 10, bottom: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Image(
                image: AssetImage('assets/images/pokeball.png'),
                fit: BoxFit.fill,
                color: const Color.fromRGBO(255, 255, 255, 0.1),
                width: 250,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FittedBox(
                child: Text(_pokemon.name.toUpperCase(), style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 0.1)),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}