import 'package:flutter/material.dart';

class PokemonDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          top: -220,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage('assets/images/25.png'),
              height: 270,
            ),
          ),
        ),
      ],
    );
  }
}