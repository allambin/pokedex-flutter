import 'package:flutter/material.dart';

class PokemonDetailsHeader extends StatelessWidget {
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
                          Text('Pikachu', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image(image: AssetImage('assets/images/electric.webp'), height: 30, width: 30,),
                          ),
                        ],
                      ),
                      Text('#025', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Text('Mouse Pokémon', style: TextStyle(color: Colors.white, fontSize: 16),),
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
              child: Text('PIKACHU', overflow: TextOverflow.visible, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 0.1)),),
            ),
          ),
        ],
      ),
    );
  }
}