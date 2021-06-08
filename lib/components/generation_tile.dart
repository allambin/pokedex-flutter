import 'package:flutter/material.dart';

class GenerationTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridTile(
          child: Image(
            image: AssetImage('assets/images/kanto.png'),
          ),
          footer: Center(child: Text('Generation 1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
        ),
      ),
    );
  }
}