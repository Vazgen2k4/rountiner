import 'package:flutter/material.dart';

abstract class AppTheme {
  const AppTheme._();

  static TextTheme get textTheme => TextTheme(
        // Заголовки
        /// Headline 1
        headlineLarge: TextStyle(
          fontSize: 48,
          height: 56 / 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'AirbnbCereal',
        ),

        /// Headline 2
        headlineMedium: TextStyle(
          fontSize: 40,
          height: 48 / 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'AirbnbCereal',
        ),

        /// Headline 3
        headlineSmall: TextStyle(
          fontSize: 36,
          height: 40 / 36,
          fontWeight: FontWeight.bold,
          fontFamily: 'AirbnbCereal',
        ),

        /// Headline 4
        titleLarge: TextStyle(
          fontSize: 32,
          height: 40 / 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'AirbnbCereal',
        ),

        /// Headline 5
        titleMedium: TextStyle(
          fontSize: 24,
          height: 32 / 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'AirbnbCereal',
        ),

        /// Headline 6
        titleSmall: TextStyle(
          fontSize: 20,
          height: 24 / 20,
          fontWeight: FontWeight.w500,
          fontFamily: 'AirbnbCereal',
        ),

        /// Title
        bodyLarge: TextStyle(
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'AirbnbCereal',
        ),

        /// Paragraph 1
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.normal,
          fontFamily: 'AirbnbCereal',
        ),

        /// Paragraph 2
        bodySmall: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.normal,
          fontFamily: 'AirbnbCereal',
        ),

        /// CHIPS
        labelLarge: TextStyle(
          fontSize: 10,
          height: 16 / 10,
          fontWeight: FontWeight.bold,
          fontFamily: 'AirbnbCereal',
        ),
      );

  static ThemeData get lightTheme =>
      ThemeData.light(useMaterial3: true).copyWith(
        textTheme: ThemeData.light()
            .textTheme
            .apply(
              fontFamily: 'AirbnbCereal',
            )
            .copyWith(),
      );
  static ThemeData get darkTheme =>
      ThemeData.dark(useMaterial3: true).copyWith();
}
