import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/services/pokemon_type_api.dart';

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

    // typesFromJson.forEach((name) async {
    //   var type = await typeApi.fetchType(e['type']['name']);
    // });

    // return Pokemon.fromJson(body);

    // List<Type> types = [];
    // Iterable extractedTypes = extractedData['types'];
    // extractedTypes.forEach((element) {
    //   Type type = Type(element['type']['name']);
    //   types.add(type);
    // });
  }

  Future<List<String>> fetchPokemonNames() async {
    print('fetch pokemon names');
    var url = Uri.https(domain, '/api/v2/pokemon');
    List<String> names = [];

    String next;
    do {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as Map<String, dynamic>;
        next = extractedData['next'];
        if (next != null) {
          url = Uri.parse(extractedData['next']);
        }
        Iterable items = extractedData['results'];
        // print(items);
        items.forEach((element) {
          print(element['name']);
          names.add(element['name']);
        });
      } else {
        throw Exception('Failed to load names');
      }
    } while (next != null && names.length < 10);
    
    return names;
  }
}