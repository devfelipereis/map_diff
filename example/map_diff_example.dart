import 'package:map_diff/map_diff.dart';

void main() {
  final left = <String, dynamic>{};
  final right = <String, dynamic>{'key': 'value'};
  final diff = mapDiff(left, right);

  print(diff); //
}
