import 'dart:async';
import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../models/pokemon_move.dart';
import '../models/move.dart';

class MoveApi {
  final String domain = 'pokeapi.co';

  Future<Move> fetchMove(String name) async {
    try {
      print('fetch move');
      final url = Uri.https(domain, '/api/v2/move/$name');
      var file = await DefaultCacheManager().getSingleFile(url.toString());
      final contents = await file.readAsString();

      return Move.fromJson(json.decode(contents));
    } catch (e) {
      throw Exception('Failed to load Move');
    }
  }

  Future<List<PokemonMove>> fillUpMoves(List<PokemonMove> pkmnMoves) async {
    var completer = Completer<List<PokemonMove>>();

    for (var pkmnMove in pkmnMoves) {
      var move = await fetchMove(pkmnMove.move.name);
      pkmnMove.move = move;
    }

    completer.complete(pkmnMoves);
    return completer.future;
  }
}