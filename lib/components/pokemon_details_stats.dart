import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:charcode/charcode.dart";

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
                    TableCell(child: LinearPercentIndicator(percent: element.value/255, progressColor: Colors.blue,),),
                  ],
                );
              }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Text('Type Effectiveness', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.blue[400])),),
          ),
          Container(
            height: 150,
            child: GridView.count(
              crossAxisCount: 9,
              childAspectRatio: .6,
              children: pokemon.typeChart.entries.map((element) {
                return GridTile(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/types/${element.key}.svg', width: 30, height: 30,),
                      Text(element.value == .5 ? String.fromCharCode($frac12) : element.value == .25 ? String.fromCharCode($frac14) : element.value.toInt().toString(), style: TextStyle(fontSize: 18),),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}