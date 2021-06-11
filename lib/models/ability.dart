import 'package:flutter/foundation.dart';

class Ability {
  final String name;
  final bool isHidden;
  final int order;

  Ability({@required this.name, @required this.isHidden, @required this.order});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json['ability']['name'],
      isHidden: json['is_hidden'],
      order: json['slot'],
    );
  }
}