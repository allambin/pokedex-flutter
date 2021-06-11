import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../theme/styles.dart';

class PokemonDetailsAbout extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsAbout(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(pokemon.description.replaceAll('\n', ' ')),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('Pokedex Data', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.blue[400])),),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(150),
              1: FlexColumnWidth(),
            },
            children: [
              TableRow(
                children: [
                  TableCell(child: SizedBox(height: 35, child: Align(child: Text('Species', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                  Text(pokemon.genus, style: ThemeText.tableTd,),
                ]
              ),
              TableRow(
                children: [
                  TableCell(child: SizedBox(height: 35, child: Align(child: Text('Height', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                  Text('${pokemon.height}m', style: ThemeText.tableTd,),
                ]
              ),
              TableRow(
                children: [
                  TableCell(child: SizedBox(height: 35, child: Align(child: Text('Weight', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                  Text('${pokemon.weight}kg', style: ThemeText.tableTd,),
                ]
              ),
              TableRow(
                children: [
                  TableCell(child: SizedBox(height: 35, child: Align(child: Text('Abilities', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.abilities.map((e) => Text(e.name)).toList(),
                  ),
                ]
              ),
              TableRow(
                children: [
                  TableCell(child: SizedBox(height: 35, child: Align(child: Text('Weaknesses', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                  Row(
                    children:pokemon.weaknesses.map((type) {
                      return type;
                    }).toList(),
                  ),
                ]
              ),
            ],
          ),
        ]
      ),
    );
  }
}