import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/type.dart';

class PokemonTypeApi {
  final String domain = 'pokeapi.co';

  Future<Type> fetchType(String name) async {
    print('fetch type');
    final url = Uri.https(domain, '/api/v2/type/$name');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Type.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}