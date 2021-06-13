import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './ability.dart';
import './type.dart';

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

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> spritesFromJson = json['sprites'];
    
    Iterable abilitiesFromJson = json['abilities'];
    List<Ability> abilities = List<Ability>.from(abilitiesFromJson.map((model)=> Ability.fromJson(model)));
    abilities.sort((a, b) => a.order.compareTo(b.order));
    
    Iterable statsFromJson = json['stats'];
    Map<String, int> stats = {};
    statsFromJson.forEach((element) {
      stats[element['stat']['name']] = element['base_stat'];
    });

    Iterable generaFromJson = json['genera'];
    var genera = generaFromJson.where((element) => element['language']['name'] == 'en').first;

    Iterable descriptionsFromJson = json['flavor_text_entries'];
    var description = descriptionsFromJson.where((element) => element['language']['name'] == 'en' && element['version']['name'] == 'lets-go-pikachu').first;
    
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
    );
  }
}