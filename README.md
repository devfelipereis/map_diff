# map_diff

[![Build Status](https://github.com/devfelipereis/map_diff/workflows/Dart/badge.svg?branch=main&event=push)](https://github.com/devfelipereis/map_diff/actions)

A dart package to compare two maps and return the differences between them.

## Getting Started

### Pubspec

```yaml
dependencies:
  map_diff: ^1.0.0
```

### Example

```dart
import 'package:map_diff/map_diff.dart';

final left = <String, dynamic>{};
final right = <String, dynamic>{'key': 'value'};
final diff = mapDiff(left, right);

print(diff); // {key: value}
```

### Tests

```bash
dart run test/map_diff_test.dart
```