import 'package:map_diff/map_diff.dart';

void main() {
  final left = <String, dynamic>{
    'key': 'value',
    'key2': 'value2',
    'key3': {'key4': 'value4'},
    'key6': {
      'key7': {'key8': 'key9'}
    },
  };
  final right = <String, dynamic>{
    'key2': 'value2',
    'key3': {'key4': 'value5'},
    'key6': {'key7': {}},
  };

  final diff = mapDiff(left, right);

  print(diff); // {key: value, key3: {key4: value5}, key6: {key7: {key8: key9}}}
}
