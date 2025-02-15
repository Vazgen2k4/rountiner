import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:rountiner/core/extensions/color_extension.dart';

void main() {
  group('Color toHex tests', () {
    final testCases = [
      {'color': Color(0xFFFF0000), 'expectedHex': '#FFFF0000'},
      {'color': Color(0xFF00FF00), 'expectedHex': '#FF00FF00'},
      {'color': Color(0xFF0000FF), 'expectedHex': '#FF0000FF'},
      {'color': Color(0x80000000), 'expectedHex': '#80000000'},
    ];

    for (var testCase in testCases) {
      test('toHex for color: ${testCase['color']}', () {
        final color = testCase['color'] as Color;
        final expectedHex = testCase['expectedHex'] as String;

        expect(color.toHex(), expectedHex);
        expect(
            color.toHex(includeAlpha: false), '#${expectedHex.substring(3)}');
      });
    }
  });

  group('Color fromHex tests', () {
    final testCases = [
      {'hex': '#FFFF0000', 'expectedColor': Color(0xFFFF0000)},
      {'hex': '#FF00FF00', 'expectedColor': Color(0xFF00FF00)},
      {'hex': '#FF0000FF', 'expectedColor': Color(0xFF0000FF)},
      {'hex': '#80000000', 'expectedColor': Color(0x80000000)},
      {'hex': '#00FF00', 'expectedColor': Color(0xFF00FF00)},
    ];

    for (var testCase in testCases) {
      test('fromHex for hex: ${testCase['hex']}', () {
        final hex = testCase['hex'] as String;
        final expectedColor = testCase['expectedColor'] as Color;

        expect(ColorExtension.fromHex(hex), expectedColor);
      });
    }
  });

  group('Colors copy with opacity', () {
    test('Test 10 different opacities', () {
      final color = Color(0xFFFF0000);

      final testCases = [
        {'opacity': 0.0, 'expected': Color(0x00FF0000)},
        {'opacity': 0.1, 'expected': Color(0x1AFF0000)},
        {'opacity': 0.2, 'expected': Color(0x33FF0000)},
        {'opacity': 0.3, 'expected': Color(0x4DFF0000)},
        {'opacity': 0.4, 'expected': Color(0x66FF0000)},
        {'opacity': 0.5, 'expected': Color(0x80FF0000)},
        {'opacity': 0.6, 'expected': Color(0x99FF0000)},
        {'opacity': 0.7, 'expected': Color(0xB3FF0000)},
        {'opacity': 0.8, 'expected': Color(0xCCFF0000)},
        {'opacity': 0.9, 'expected': Color(0xE6FF0000)},
        {'opacity': 1.0, 'expected': Color(0xFFFF0000)},
      ];

      for (final testCase in testCases) {
        final opacity = testCase['opacity'] as double;
        final expected = testCase['expected'] as Color;

        expect(
          color.copyWithOpacity(opacity),
          expected,
          reason: 'Failed for opacity: $opacity',
        );
      }
    });
    
    test('Test invalid opacities', () {
      final color = Color(0xFFFF0000);
      expect(() => color.copyWithOpacity(-0.1), throwsException);
      expect(() => color.copyWithOpacity(1.1), throwsException);
    });
  });
}
