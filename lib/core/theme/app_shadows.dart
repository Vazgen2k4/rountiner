import 'package:flutter/material.dart';

abstract class AppShadows {
  const AppShadows._();

  static final box = BoxShadow(
    color: Color(0x0F232c5d),
    offset: Offset(58, 26),
    blurRadius: 68,
  );

  static final medium = BoxShadow(
    color: Color(0x0f232c5d),
    offset: Offset(0, 12),
    blurRadius: 24,
  );

  static final small = BoxShadow(
    color: Color(0x330B2B51),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
}
