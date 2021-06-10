import 'package:flutter/material.dart';
import '../theme/styles.dart';

class PokemonDetailsAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text('This is a first text about this Pokemon'),
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
                Text('Mouse Pokemon', style: ThemeText.tableTd,),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: SizedBox(height: 35, child: Align(child: Text('Height', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                Text('0.6kg', style: ThemeText.tableTd,),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: SizedBox(height: 35, child: Align(child: Text('Weight', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                Text('0.6m', style: ThemeText.tableTd,),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: SizedBox(height: 35, child: Align(child: Text('Abilities', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                Text('Static', style: ThemeText.tableTd,),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: SizedBox(height: 35, child: Align(child: Text('Weaknesses', style: ThemeText.tableTh,), alignment: Alignment.centerLeft,))),
                Row(
                  children: [
                    Image(image: AssetImage('assets/images/electric.webp'), width: 30,),
                  ],
                ),
              ]
            ),
          ],
        ),
      ]
    );
  }
}