import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './type.dart';
import '../utils/enum_extension.dart';

enum DamageClass {
  physical,
  special,
  other,
}

class Move {
  final String name;
  final int accuracy;
  final DamageClass damageClass;
  final Type type;
  final int powerPoints;
  final int power;

  Move({@required this.name, this.accuracy, this.damageClass, this.type, this.powerPoints, this.power});

  Image get icon {
    return Image(image: AssetImage('assets/images/${damageClass.toShortString()}.png'),);
  }

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      name: json['name'],
      accuracy: json['accuracy'],
      power: json['power'],
      damageClass: json['damage_class']['name'] == 'physical' ? DamageClass.physical : json['damage_class']['name'] == 'special' ? DamageClass.special : DamageClass.other,
      powerPoints: json['pp'],
      type: Type(json['type']['name'])
    );
  }
}