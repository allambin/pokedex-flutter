import 'package:flutter/foundation.dart';

import './type.dart';

class Pokemon {
  final String name;
  final String url;
  final double height;
  final double weight;
  final List<Type> types;

  Pokemon({@required this.name, this.url, this.height, this.weight, this.types});
}