import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pokemon.dart';
import '../models/type.dart';

class PokemonApi {
  final String domain = 'pokeapi.co';

  Future<Pokemon> fetchCurrentPokemon(String name) async {
    print('fetch pokemon');
    final url = Uri.https(domain, '/api/v2/pokemon/$name');

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    List<Type> types = [];
    Iterable extractedTypes = extractedData['types'];
    extractedTypes.forEach((element) {
      Type type = Type(element['type']['name']);
      types.add(type);
    });

    return Pokemon(name: name, height: extractedData['height'].toDouble(), weight: extractedData['weight'].toDouble(), types: types);
  }

  Future<List<String>> fetchPokemonNames() async {
    print('fetch pokemon names');
    // todo while + caching
    // final url = Uri.https('pokeapi.co', '/api/v2/pokemon');
    final url = Uri.https(domain, '/api/v2/pokemon', {'limit': '0', 'offset': '20'});

    List<String> names = [];
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    Iterable items = extractedData['results'];
    items.forEach((element) {
      names.add(element['name']);
    });

    return names;
  }
}