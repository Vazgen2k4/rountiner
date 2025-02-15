
import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();
  
  
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  
  static const primaryBlack = Color(0xFF040415);
  static const primaryBlue = Color(0xFF3843ff);
  
  static const primaryInfo = Color(0xFF12a4ed);
  static const primarySuccess = Color(0xFF3ba935);
  static const primaryWarning = Color(0xFFfea800);
  static const primaryError = Color(0xFFE3524F);
  
  static const secondaryOrange = Color(0xFFF15223);
  static const secondaryPurple = Color(0xFF8A24FF);
  static const secondaryPink = Color(0xFFFF7D7D);
  static const secondaryTeal = Color(0xFF2D9E64);
  static const secondaryYellow = Color(0xFFFFCA00);
  static const secondaryDarkBlue = Color(0xFF878EA8);
  
  static const mainGradient = LinearGradient(
    colors: [Color(0xff6B73FF), Color(0xff000DFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
}