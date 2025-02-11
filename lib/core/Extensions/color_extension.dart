import 'dart:ui';

extension ColorExtension on Color {
  String toHex({bool includeAlpha = true}) {
    final hexString = value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return includeAlpha ? '#$hexString' : '#${hexString.substring(2)}';
  }

  static Color fromHex(String hex) {
    String onlyValues = hex.replaceAll('#', '');
    if (onlyValues.length == 6) {
      onlyValues = 'FF$onlyValues'; // Применяем 255 для альфа, если её нет
    }
    return Color(int.parse('0x$onlyValues'));
  }
}
