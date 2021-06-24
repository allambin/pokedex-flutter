import '../models/move.dart';

extension ParseToString on DamageClass {
  String toShortString() {
    return this.toString().split('.').last;
  }
}