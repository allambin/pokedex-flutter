import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pokemon.dart';

class PokemonList with ChangeNotifier {
  List<Pokemon> _pokemons;

  List<Pokemon> get pokemons {
    if (_pokemons == null) {
      return List.empty();
    }
    return [..._pokemons];
  }

  Future<void> fetchPokemonNames() async {
    print('fetch pokemon names');
    // todo while + caching
    // final url = Uri.https('pokeapi.co', '/api/v2/pokemon');
    final url = Uri.https('pokeapi.co', '/api/v2/pokemon', {'limit': '0', 'offset': '20'});

    List<Pokemon> pokemons = [];
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    Iterable items = extractedData['results'];
    items.forEach((element) {
      Pokemon pokemon = Pokemon(name: element['name'], url: element['url']);
      pokemons.add(pokemon);
    });

    _pokemons = pokemons;
    print('notifyListeners');
    notifyListeners();
  }
}