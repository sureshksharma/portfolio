import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

@immutable
class MaterialTheme extends ThemeExtension<MaterialTheme> {
  const MaterialTheme({
    this.primaryColor = const Color(0xFFEA2129),
    this.secondaryColor = const Color.fromARGB(255, 255, 213, 0),
    this.tertiaryColor = const Color(0xFF28CC4C),
    this.neutralColor = const Color(0xFF9C9797),
    this.neutralVariantColor = const Color.fromARGB(255, 229, 227, 227),
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color neutralColor;
  final Color neutralVariantColor;

  DynamicScheme _scheme() {
    final primary = TonalPalette.fromHct(Hct.fromInt(primaryColor.value));
    final secondary = TonalPalette.fromHct(Hct.fromInt(secondaryColor.value));
    final tertiary = TonalPalette.fromHct(Hct.fromInt(tertiaryColor.value));
    final neutral = TonalPalette.fromHct(Hct.fromInt(neutralColor.value));
    final neutralVariant =
        TonalPalette.fromHct(Hct.fromInt(neutralVariantColor.value));
    return DynamicScheme(
      primaryPalette: primary,
      secondaryPalette: secondary,
      tertiaryPalette: tertiary,
      neutralPalette: neutral,
      neutralVariantPalette: neutralVariant,
      sourceColorArgb: primaryColor.value,
      isDark: false,
      variant: Variant.content,
    );
  }

  ThemeData _base(final ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: 'Raleway',
    );
  }

  ThemeData toThemeData(Brightness brightness) {
    final colorScheme = _scheme().toColorScheme(brightness);
    return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
  }

  @override
  ThemeExtension<MaterialTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      MaterialTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        tertiaryColor: tertiaryColor ?? this.tertiaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  MaterialTheme lerp(
    covariant ThemeExtension<MaterialTheme>? other,
    double t,
  ) {
    if (other is! MaterialTheme) return this;
    return MaterialTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }

  /// green
  static const green = ExtendedColor(
    value: Color(0xff3ec029),
  );
  static const lightgreen = ExtendedColor(
    value: Color(0xffD9F4E0),
  );
  static const lightgray = ExtendedColor(
    value: Color(0xff696969),
  );
  static const thinGray = ExtendedColor(
    value: Color(0xffC7C7C7),
  );

  static const textfildclr = ExtendedColor(
    value: Color(0xFFFEF9F9),
  );
  static const black = ExtendedColor(
    value: Colors.black,
  );

  static const gray = ExtendedColor(
    value: Color(0xff494949),
  );
  static const whait = ExtendedColor(
    value: Color.fromARGB(255, 255, 255, 255),
  );
  static const red = ExtendedColor(value: Color(0xffFE5B52));

  /// light-orange
  static const lightOrange = ExtendedColor(
    value: Color(0xffee9220),
  );

  /// dark brown
  static const dartBrown = ExtendedColor(
    value: Color(0xff060527),
  );

  /// yellow
  static const yellow = ExtendedColor(
    value: Color(0xffFDB81F),
  );

  /// pink
  static const pink = ExtendedColor(
    value: Color(0xffe523a7),
  );

  /// blue
  static const blue = ExtendedColor(
    value: Color(0xff00335f),
  );

  /// cream
  static const cream = ExtendedColor(
    value: Color(0xffedcca0),
  );

  /// orange
  static const orange = ExtendedColor(
    value: Color(0xffee9220),
  );

  /// dark-orange
  static const darkOrange = ExtendedColor(
    value: Color(0xffd8771e),
  );

  /// bg-Doctor-Card
  static const bgDoctorCard = ExtendedColor(
    value: Color(0xffF7F6FA),
  );

  /// bg-Upload-Document
  static const bgUploadDocument = ExtendedColor(
    value: Color(0xffF8F8FF),
  );

  /// color-festival
  static const colorFestival = ExtendedColor(
    value: Color(0xffDD531B),
  );
  static const lightBlue = ExtendedColor(
    value: Color(0xff1570EF),
  );
  static const drawerBackground = ExtendedColor(
    value: Color(0xff2F1315),
  );
}

extension on DynamicScheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      primary: Color(primary),
      onPrimary: Color(onPrimary),
      primaryContainer: Color(primaryContainer),
      onPrimaryContainer: Color(onPrimaryContainer),
      secondary: Color(secondary),
      onSecondary: Color(onSecondary),
      secondaryContainer: Color(secondaryContainer),
      onSecondaryContainer: Color(onSecondaryContainer),
      tertiary: Color(tertiary),
      onTertiary: Color(onTertiary),
      tertiaryContainer: Color(tertiaryContainer),
      onTertiaryContainer: Color(onTertiaryContainer),
      error: Color(error),
      onError: Color(onError),
      errorContainer: Color(errorContainer),
      onErrorContainer: Color(onErrorContainer),
      outline: Color(outline),
      outlineVariant: Color(outlineVariant),
      surface: Color(surface),
      onSurface: Color(onSurface),
      surfaceContainerHighest: Color(surfaceVariant),
      onSurfaceVariant: Color(onSurfaceVariant),
      inverseSurface: Color(inverseSurface),
      onInverseSurface: Color(inverseOnSurface),
      inversePrimary: Color(inversePrimary),
      shadow: Color(shadow),
      scrim: Color(scrim),
      surfaceTint: Color(primary),
      brightness: brightness,
    );
  }
}

class ExtendedColor {
  final Color value;

  const ExtendedColor({
    required this.value,
  });
}

extension Material3Palette on Color {
  Color tone(int tone) {
    assert(tone >= 0 && tone <= 100);
    final color = Hct.fromInt(value);
    final tonalPalette = TonalPalette.of(color.hue, color.chroma);
    return Color(tonalPalette.get(tone));
  }
}
