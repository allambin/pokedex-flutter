import 'package:flutter/material.dart';

class PokemonCardType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5,),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image(image: AssetImage('assets/images/electric.webp'), height: 30, width: 30,),
          Text('Electric', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}