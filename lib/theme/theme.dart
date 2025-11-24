import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.indigo,
  brightness: Brightness.light,
);

final ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.indigo,
  brightness: Brightness.dark,
);

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(),
  cardTheme: const CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: lightColorScheme.surfaceContainerHighest,
    labelStyle: TextStyle(color: lightColorScheme.onSurface),
    selectedColor: lightColorScheme.primaryContainer,
    secondarySelectedColor: lightColorScheme.secondaryContainer,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  cardTheme: const CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: darkColorScheme.surfaceContainerHighest,
    labelStyle: TextStyle(color: darkColorScheme.onSurface),
    selectedColor: darkColorScheme.primaryContainer,
    secondarySelectedColor: darkColorScheme.secondaryContainer,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
