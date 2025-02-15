import 'dart:ui';

extension ColorExtension on Color {
  String toHex({bool includeAlpha = true}) {
    final hexString = value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return includeAlpha ? '#$hexString' : '#${hexString.substring(2)}';
  }

  static Color fromHex(String hex) {
    String onlyValues = hex.replaceAll('#', '');
    if (onlyValues.length == 6) {
      onlyValues = 'FF$onlyValues';
    }
    return Color(int.parse('0x$onlyValues'));
  }

  Color copyWithOpacity(double opacity) {
    if (opacity < 0 || opacity > 1) {
      throw Exception('Opacity must be between 0 and 1');
    }

    return withAlpha((opacity * 255).round());
  }
}
