import 'package:collection/collection.dart';

final _listDeepEq = DeepCollectionEquality().equals;

/// Returns a new map contend only difference between maps
/// [left] Reference map
/// [right] Map to compare
Map mapDiff(Map left, Map right) {
  final rightCopy = Map.of(right);
  final diff = {};

  left.forEach((leftKey, leftValue) {
    if (!right.containsKey(leftKey)) {
      diff[leftKey] = leftValue;
      return;
    }

    final rightValue = right[leftKey];

    switch ((leftValue, rightValue)) {
      case (Map(), Map()):
        diff[leftKey] = mapDiff(leftValue, rightValue);
        break;
      case (List(), List()):
        if (!_listDeepEq(leftValue, rightValue)) {
          diff[leftKey] = rightValue;
        }
        break;
      case (_, _):
        if (leftValue != rightValue) {
          diff[leftKey] = rightValue;
        }
        break;
    }

    rightCopy.remove(leftKey);
  });

  return {...diff, ...rightCopy};
}
