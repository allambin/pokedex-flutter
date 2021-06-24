import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './move.dart';
import './pokemon_move.dart';
import './ability.dart';
import './type.dart';
import './generation.dart';

class Pokemon {
  final String name;
  final String url;
  final String genus;
  final double height;
  final double weight;
  final String artworkUrl;
  final String description;
  final int id;
  List<Type> types;
  final List<Ability> abilities;
  final Map<String, int> stats;
  List<PokemonMove> moves;

  Pokemon({
    @required this.name,
    this.url,
    this.height,
    this.weight,
    this.types,
    this.id,
    this.genus,
    this.artworkUrl,
    this.description,
    this.abilities,
    this.stats,
    this.moves,
  });

  String get number {
    if (this.id < 10) {
      return '00$id';
    }
    if (this.id < 100) {
      return '0$id';
    }

    return this.id.toString();
  }

  // todo rename to specify we get icons
  List<SvgPicture> get weaknesses {
    List<SvgPicture> icons = [];
    this.types.forEach((type) {
      type.weaknesses.forEach((element) {
        icons.add(element);
      });
    });

    return icons;
  }

  Map<String, double> get typeChart {
    Map<String, double> typeChart = Map.fromEntries(Type.listOfTypes().map((value) {
      return MapEntry(value, 1);
    }));
    this.types.forEach((type) {
      type.damageRelations.forEach((key, typeNames) {
        double damage = 1;
        switch (key) {
          case 'double_damage_from':
            damage = 2;
            break;
          case 'half_damage_from':
            damage = .5;
            break;
          case 'no_damage_from':
            damage = 0;
            break;
          default:
        }

        typeNames.forEach((typeName) {
          if (typeChart.containsKey(typeName)) {
            typeChart[typeName] = typeChart[typeName] * damage;
          } else {
            typeChart[typeName] = damage;
          }
        });
      });
    });

    return typeChart;
  }

  Map<String, int> get displayStats {
    Map<String, int> newStats = {};
    this.stats.forEach((key, value) {
      String newKey;
      switch (key) {
        case 'attack':
          newKey = 'Atk';
          break;
        case 'defense':
          newKey = 'Def';
          break;
        case 'special-attack':
          newKey = 'Sp Atk';
          break;
        case 'special-defense':
          newKey = 'Sp Def';
          break;
        default:
          newKey = key;
          break;
      }

      newStats[newKey] = value;
    });

    return newStats;
  }

  List<PokemonMove> getLevelUpMoves(int generation) {
    List<PokemonMove> moves = this.moves
    .where((element) => element.learningMethod == LearningMethod.levelUp)
    .where((element) => Generation.getSlugs(generation).contains(element.version))
    .toList();
    moves.sort((a, b) => a.levelLearnedAt.compareTo(b.levelLearnedAt));
    final names = moves.map((e) => e.move.name).toSet();
    moves.retainWhere((element) => names.remove(element.move.name));
    return moves;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> spritesFromJson = json['sprites'];

    List<PokemonMove> pkmnMoves = [];
    Iterable movesFromJson = json['moves'];
    movesFromJson.forEach((m) {
      Iterable moveVersionsFromJson = m['version_group_details'];
      Move move = new Move(name: m['move']['name']);
      moveVersionsFromJson.forEach((element) {
        PokemonMove pkmnMove = PokemonMove.fromJson(move, element);
        pkmnMoves.add(pkmnMove);
      });
    });

    Iterable abilitiesFromJson = json['abilities'];
    List<Ability> abilities = List<Ability>.from(abilitiesFromJson.map((model) => Ability.fromJson(model)));
    abilities.sort((a, b) => a.order.compareTo(b.order));
    
    Iterable statsFromJson = json['stats'];
    Map<String, int> stats = {};
    statsFromJson.forEach((element) {
      stats[element['stat']['name']] = element['base_stat'];
    });

    Iterable generaFromJson = json['genera'];
    var genera = generaFromJson.where((element) => element['language']['name'] == 'en').first;

    Iterable descriptionsFromJson = json['flavor_text_entries'];
    var description = descriptionsFromJson.firstWhere((element) => element['language']['name'] == 'en');
    
    return Pokemon(
      name: json['name'],
      height: json['height'] / 10,
      weight: json['weight'] / 10,
      id: json['id'],
      genus: genera['genus'],
      artworkUrl: spritesFromJson['other']['official-artwork']['front_default'],
      description: description['flavor_text'],
      abilities: abilities,
      stats: stats,
      moves: pkmnMoves,
    );
  }
}