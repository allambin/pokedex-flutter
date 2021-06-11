import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/pokemon.dart';
import '../theme/styles.dart';

class PokemonDetailsStats extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsStats(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('Base Stats', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.blue[400])),),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FlexColumnWidth(),
              1: FixedColumnWidth(50),
              2: FixedColumnWidth(200),
            },
            children: pokemon.displayStats.entries.map((element) {
                return TableRow(
                  children: [
                    TableCell(child: SizedBox(height:35, child: Align(child: Text(element.key, style: ThemeText.tableTd,), alignment: Alignment.centerLeft,)),),
                    TableCell(child: Text(element.value.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                    // TableCell(child: LinearPercentIndicator(percent: element.value/100, progressColor: Colors.blue,),),
                  ],
                );
              }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Text('Type Effectiveness', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.blue[400])),),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: new List.generate(9, (index) => TableCell(child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image(image: AssetImage('assets/images/electric.webp')),
                )))
              ),
              TableRow(
                children: new List.generate(9, (index) => TableCell(child: Center(child: Text('1'),),))
              ),
              TableRow(
                children: new List.generate(9, (index) => TableCell(child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image(image: AssetImage('assets/images/electric.webp')),
                )))
              ),
              TableRow(
                children: new List.generate(9, (index) => TableCell(child: Center(child: Text('1'),),))
              ),
            ],
          ),
        ],
      ),
    );
  }
}