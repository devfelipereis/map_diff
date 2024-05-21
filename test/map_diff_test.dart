import 'package:map_diff/map_diff.dart';
import 'package:test/test.dart';

void main() {
  test('empty maps should return an empty map', () {
    final left = <String, dynamic>{};
    final right = <String, dynamic>{};
    final diff = mapDiff(left, right);

    expect(diff.isEmpty, isTrue);
  });

  test('right map has keys that left map does not', () {
    final left = <String, dynamic>{};
    final right = <String, dynamic>{'key': 'value'};
    final diff = mapDiff(left, right);

    expect(diff, right);
  });

  test('left map has keys that right map does not', () {
    final left = <String, dynamic>{'key': 'value'};
    final right = <String, dynamic>{};

    final diff = mapDiff(left, right);

    expect(diff, left);
  });

  test('right map and left map are equal', () {
    final left = <String, dynamic>{'key': 'value'};
    final right = <String, dynamic>{'key': 'value'};

    final diff = mapDiff(left, right);

    expect(diff, {});
  });

  test('diff in nested maps should be applied', () {
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

    expect(diff, {
      'key': 'value',
      'key3': {'key4': 'value5'},
      'key6': {
        'key7': {'key8': 'key9'}
      },
    });
  });
}
