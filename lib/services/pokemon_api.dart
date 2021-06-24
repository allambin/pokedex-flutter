import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;

import '../services/pokemon_type_api.dart';
import '../models/pokemon.dart';
import '../models/type.dart';

class PokemonApi {
  final String domain = 'pokeapi.co';
  PokemonTypeApi typeApi = PokemonTypeApi();

  Future<Pokemon> fetchCurrentPokemon(String name) async {
    print('fetch pokemon');
    final urlPokemon = Uri.https(domain, '/api/v2/pokemon/$name');
    final urlSpecies = Uri.https(domain, '/api/v2/pokemon-species/$name');

    final responsePokemon = http.get(urlPokemon);
    final responseSpecies = http.get(urlSpecies);
    var results = await Future.wait([responsePokemon, responseSpecies]);
    Map<String, dynamic> body = {};

    for (var response in results) {
      if (response.statusCode == 200) {
        body.addAll(json.decode(response.body));
      } else {
        throw Exception('Failed to load Pokemon');
      }
    }

    // handle types
    Iterable typesFromJson = body['types'];
    List<String> typeNames = List<String>.from(typesFromJson.map((e)=> e['type']['name']));
    List<Type> types = [];
    await Future.forEach(typeNames, (name) async {
      var type = await typeApi.fetchType(name);
      types.add(type);
    });

    Pokemon pokemon = Pokemon.fromJson(body);
    pokemon.types = types;
    return pokemon;
  }

  Future<List<String>> fetchPokemonNames() async {
    try {
      print('fetch pokemon names');
      var url = Uri.https(domain, '/api/v2/pokemon');
      List<String> names = [];

      String next;
      do {
        // var response = await http.get(url);
        var file = await DefaultCacheManager().getSingleFile(url.toString());
        final contents = await file.readAsString();
        // print(contents);

        // if (response.statusCode == 200) {
        final extractedData = json.decode(contents);
        // final extractedData = json.decode(response.body) as Map<String, dynamic>;
        next = extractedData['next'];
        if (next != null) {
          url = Uri.parse(extractedData['next']);
        }
        Iterable items = extractedData['results'];
        // print(items);
        items.forEach((element) {
          // print(element['name']);
          names.add(element['name']);
        });
        // } else {
        //   throw Exception('Failed to load names');
        // }
      } while (next != null);
      
      return names;
    } catch (e) {
      print(e);
      throw Exception('Failed to load names');
    }
  }
}