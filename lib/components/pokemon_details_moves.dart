import 'package:flutter/material.dart';

class PokemonDetailsMoves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding( // todo make a title component or something
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('By leveling up', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.blue[400])),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: new List.generate(8, (index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Center(child: Text('I')),
                ),
              )),
          ),
          Table(
            children: [
              TableRow(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                children: [
                  TableCell(child: Text('Lvl'),),
                  TableCell(child: Text('Move'),),
                  TableCell(child: Text('Type'),),
                  TableCell(child: Text('Cat.'),),
                  TableCell(child: Text('Pwr.'),),
                  TableCell(child: Text('Acc.'),),
                  TableCell(child: Text('PP'),),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                children: [
                  TableCell(child: Text('1', style: TextStyle(fontSize: 14),),),
                  TableCell(child: Text('Play Nice', style: TextStyle(fontSize: 14)),),
                  TableCell(child: Container(
                    child: Text('Normal', style: TextStyle(fontSize: 14)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.yellow,
                    ),
                  ),),
                  TableCell(child: Text('Status', style: TextStyle(fontSize: 14)),),
                  TableCell(child: Text('-', style: TextStyle(fontSize: 14)),),
                  TableCell(child: Text('-', style: TextStyle(fontSize: 14)),),
                  TableCell(child: Text('20', style: TextStyle(fontSize: 14)),),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('1'),),
                  TableCell(child: Text('Nuzzle'),),
                  TableCell(child: Text('Electric'),),
                  TableCell(child: Text('Physical'),),
                  TableCell(child: Text('20'),),
                  TableCell(child: Text('100%'),),
                  TableCell(child: Text('20'),),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('1'),),
                  TableCell(child: Text('Thunder Shock'),),
                  TableCell(child: Text('Electric'),),
                  TableCell(child: Text('Special'),),
                  TableCell(child: Text('20'),),
                  TableCell(child: Text('100%'),),
                  TableCell(child: Text('20'),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}