import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:rountiner/core/extensions/color_extension.dart';

void main() {
  final toHexTestCases = [
    {'color': Color(0xFFFF0000), 'expectedHex': '#FFFF0000'},
    {'color': Color(0xFF00FF00), 'expectedHex': '#FF00FF00'},
    {'color': Color(0xFF0000FF), 'expectedHex': '#FF0000FF'},
    {'color': Color(0x80000000), 'expectedHex': '#80000000'},
  ];

  final fromHexTestCases = [
    {'hex': '#FFFF0000', 'expectedColor': Color(0xFFFF0000)},
    {'hex': '#FF00FF00', 'expectedColor': Color(0xFF00FF00)},
    {'hex': '#FF0000FF', 'expectedColor': Color(0xFF0000FF)},
    {'hex': '#80000000', 'expectedColor': Color(0x80000000)},
    {'hex': '#00FF00', 'expectedColor': Color(0xFF00FF00)},
  ];

  group('Color toHex tests', () {
    for (var testCase in toHexTestCases) {
      test('toHex for color: ${testCase['color']}', () {
        final color = testCase['color'] as Color;
        final expectedHex = testCase['expectedHex'] as String;

        expect(color.toHex(), expectedHex);
        expect(color.toHex(includeAlpha: false), '#${expectedHex.substring(3)}');
      });
    }
  });

  group('Color fromHex tests', () {
    for (var testCase in fromHexTestCases) {
      test('fromHex for hex: ${testCase['hex']}', () {
        final hex = testCase['hex'] as String;
        final expectedColor = testCase['expectedColor'] as Color;

        expect(ColorExtension.fromHex(hex), expectedColor);
      });
    }
  });
}
