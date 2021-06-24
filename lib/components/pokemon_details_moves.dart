import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';
import 'package:pokedex/components/pokemon_moves_table.dart';

import '../models/pokemon_move.dart';
import '../models/pokemon.dart';
import '../services/move_api.dart';

class PokemonDetailsMoves extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsMoves(this.pokemon);

  @override
  _PokemonDetailsMovesState createState() => _PokemonDetailsMovesState();
}

class _PokemonDetailsMovesState extends State<PokemonDetailsMoves> {
  final MoveApi api = MoveApi();
  var _currentGenerationNumber = 1;
  var _isLoading = false;
  Future<List<PokemonMove>> _displayedMoves;

  @override
  void initState() {
    super.initState();
    var pkmnMoves = widget.pokemon.getLevelUpMoves(_currentGenerationNumber);
    _displayedMoves = api.fillUpMoves(pkmnMoves);
  }

  void changeGeneration(int index) {
    setState(() {
      _currentGenerationNumber = index;
      var pkmnMoves = widget.pokemon.getLevelUpMoves(_currentGenerationNumber);
      _displayedMoves = api.fillUpMoves(pkmnMoves);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? CircularProgressIndicator() : SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding( // todo make a title component or something
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('By leveling up', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.blue[400])),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: new List.generate(8, (index) {
              return InputChip(
                selected: _currentGenerationNumber == index + 1,
                label: Text((index+1).toRomanNumeralString()),
                onSelected: (bool value) {
                  changeGeneration(index + 1);
                },
              );
            }),
          ),
          FutureBuilder<List<PokemonMove>>(
            future: _displayedMoves,
            builder: (context, snapshot) {
              if(snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return PokemonMovesTable(snapshot.data);
            },
          ),
        ],
      ),
    );
  }
}