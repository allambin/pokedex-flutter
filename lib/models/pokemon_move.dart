import 'package:flutter/foundation.dart';

import './move.dart';

enum LearningMethod {
  levelUp,
  machine,
}

class PokemonMove {
  Move move;
  final int levelLearnedAt;
  final LearningMethod learningMethod;
  final String version;

  PokemonMove({
    @required this.move,
    this.levelLearnedAt = 0,
    @required this.learningMethod,
    @required this.version
  });

  factory PokemonMove.fromJson(Move move, Map<String, dynamic> json) {
    return PokemonMove(
      move: move,
      learningMethod: json['move_learn_method']['name'] == 'machine' ? LearningMethod.machine : LearningMethod.levelUp,
      levelLearnedAt: json['level_learned_at'],
      version: json['version_group']['name'],
    );
  }
}