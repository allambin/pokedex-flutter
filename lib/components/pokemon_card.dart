import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card_type.dart';

class PokemonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              color: Color(0xffF2CB55),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('#025', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text('Pikachu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: PokemonCardType(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 5,
          child: Container(
              child: Image(
              image: AssetImage('assets/images/pokeball.png'),
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -40,
          child: Image(
            image: AssetImage('assets/images/25.png'),
            height: 150,
          ),
        ),
      ],
    );
  }
}