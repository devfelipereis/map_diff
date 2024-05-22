# map_diff

[![Build Status](https://github.com/devfelipereis/map_diff/actions/workflows/dart.yml/badge.svg?branch=main&event=push)](https://github.com/devfelipereis/map_diff/actions)

A dart package to compare two maps and return the differences between them.

## Getting Started

### Pubspec

```yaml
dependencies:
  map_diff: ^1.0.1
```

### Example

```dart
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
```

### Tests

```bash
dart run test/map_diff_test.dart
```
