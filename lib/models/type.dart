// import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Type {
  final String name;
  final Map<String, List<String>> damageRelations;

  Type(this.name, this.damageRelations);

  SvgPicture get icon {
    return SvgPicture.asset('assets/images/types/$name.svg', width: 30, height: 30,);
  }

  List<SvgPicture> get weaknesses {
    List<SvgPicture> icons = [];
    this.damageRelations['double_damage_from'].forEach((name) {
      icons.add(SvgPicture.asset('assets/images/types/$name.svg', width: 30, height: 30,));
    });

    return icons;
  }

  factory Type.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>> damageRelations = {};
    Map<String, dynamic> damageRelationsFromJson = json['damage_relations'];

    damageRelationsFromJson.forEach((damageType, typesFromJson) {
      List<String> damagingTypes = [];
      typesFromJson.forEach((element) {
        damagingTypes.add(element['name']);
      });
      
      damageRelations[damageType] = damagingTypes;
    });

    return Type(json['name'], damageRelations);
  }
}