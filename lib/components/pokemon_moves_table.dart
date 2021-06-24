import 'package:flutter/material.dart';

import '../utils/string_extension.dart';
import '../models/pokemon_move.dart';

class PokemonMovesTable extends StatelessWidget {
  final List<PokemonMove> pkmnMoves;

  const PokemonMovesTable(this.pkmnMoves);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(30),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(50),
        3: FixedColumnWidth(40),
        4: FixedColumnWidth(50),
        5: FixedColumnWidth(30),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          children: [
            TableCell(child: Text('Lvl'),),
            TableCell(child: Text('Move'),),
            TableCell(child: Text('Cat.'),),
            TableCell(child: Text('Pwr.'),),
            TableCell(child: Text('Acc.'),),
            TableCell(child: Text('PP'),),
          ],
        ),
        for (var pkmnMove in pkmnMoves) TableRow(
          children: [
            TableCell(child: Text(pkmnMove.levelLearnedAt.toString())),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                    // color: move.move.type.color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(pkmnMove.move.name.capitalize())
                ),
              )
            ),
            TableCell(child: pkmnMove.move.icon),
            TableCell(child: Text(pkmnMove.move.power == null ? '-' : pkmnMove.move.power.toString()),),
            TableCell(child: Text(pkmnMove.move.accuracy == null ? '-' : pkmnMove.move.accuracy.toString()),),
            TableCell(child: Text(pkmnMove.move.powerPoints.toString()),),
          ]
        ),
      ],
    );
  }
}