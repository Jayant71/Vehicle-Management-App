import 'package:flutter/material.dart';

// class AppColors {
//   static const Color primaryColor = Color(0xFF2E73E0);
//   static const Color primaryColorDark = Color(0xFF190A55);
//   static const Color lightBackgroundColor = Color(0xFFFFFFFF);
//   static const Color darkBackgroundColor = Color(0xFF000A33);
//   static const Color grey = Color(0xFFD9D9D9);
//   static const Color darkGrey = Color(0xFF23272e);
//   static const Color lightGrey = Color(0xFFf0f6fc);
//   static const Color getStartedContainerColor = Color(0xFF190A55);
//   static const Color lightText = Color(0xFF000000);
//   static const Color darkText = Color(0xFFFFFFFF);
// }

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004ca7),
      surfaceTint: Color(0xff005ac3),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2b71de),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a5e88),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc4d5ff),
      onSecondaryContainer: Color(0xff2b3f68),
      tertiary: Color(0xff7c2a94),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa552bc),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff191b22),
      onSurfaceVariant: Color(0xff424753),
      outline: Color(0xff727785),
      outlineVariant: Color(0xffc2c6d5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffaec6ff),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff001a42),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff004395),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff011a41),
      secondaryFixedDim: Color(0xffb2c6f7),
      onSecondaryFixedVariant: Color(0xff32466f),
      tertiaryFixed: Color(0xfffbd7ff),
      onTertiaryFixed: Color(0xff340043),
      tertiaryFixedDim: Color(0xfff1afff),
      onTertiaryFixedVariant: Color(0xff711e89),
      surfaceDim: Color(0xffd8d9e3),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fd),
      surfaceContainer: Color(0xffecedf7),
      surfaceContainerHigh: Color(0xffe7e7f1),
      surfaceContainerHighest: Color(0xffe1e2eb),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00408d),
      surfaceTint: Color(0xff005ac3),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2b71de),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2e426b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6074a0),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff6c1885),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa552bc),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff191b22),
      onSurfaceVariant: Color(0xff3e434f),
      outline: Color(0xff5a5f6c),
      outlineVariant: Color(0xff767a88),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffaec6ff),
      primaryFixed: Color(0xff2b71de),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0058be),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6074a0),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff485c86),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa552bc),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff8938a1),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8d9e3),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fd),
      surfaceContainer: Color(0xffecedf7),
      surfaceContainerHigh: Color(0xffe7e7f1),
      surfaceContainerHighest: Color(0xffe1e2eb),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00204f),
      surfaceTint: Color(0xff005ac3),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00408d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff082148),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2e426b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3e0050),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6c1885),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1f242f),
      outline: Color(0xff3e434f),
      outlineVariant: Color(0xff3e434f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffe6ecff),
      primaryFixed: Color(0xff00408d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002a63),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2e426b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff162c53),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6c1885),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4f0065),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8d9e3),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fd),
      surfaceContainer: Color(0xffecedf7),
      surfaceContainerHigh: Color(0xffe7e7f1),
      surfaceContainerHighest: Color(0xffe1e2eb),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaec6ff),
      surfaceTint: Color(0xffaec6ff),
      onPrimary: Color(0xff002e6a),
      primaryContainer: Color(0xff1f69d6),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffb2c6f7),
      onSecondary: Color(0xff1a3057),
      secondaryContainer: Color(0xff283d65),
      onSecondaryContainer: Color(0xffbed1ff),
      tertiary: Color(0xfff1afff),
      onTertiary: Color(0xff55006c),
      tertiaryContainer: Color(0xff9e4bb5),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff11131a),
      onSurface: Color(0xffe1e2eb),
      onSurfaceVariant: Color(0xffc2c6d5),
      outline: Color(0xff8c909f),
      outlineVariant: Color(0xff424753),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2eb),
      inversePrimary: Color(0xff005ac3),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff001a42),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff004395),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff011a41),
      secondaryFixedDim: Color(0xffb2c6f7),
      onSecondaryFixedVariant: Color(0xff32466f),
      tertiaryFixed: Color(0xfffbd7ff),
      onTertiaryFixed: Color(0xff340043),
      tertiaryFixedDim: Color(0xfff1afff),
      onTertiaryFixedVariant: Color(0xff711e89),
      surfaceDim: Color(0xff11131a),
      surfaceBright: Color(0xff373940),
      surfaceContainerLowest: Color(0xff0b0e14),
      surfaceContainerLow: Color(0xff191b22),
      surfaceContainer: Color(0xff1d1f26),
      surfaceContainerHigh: Color(0xff272a31),
      surfaceContainerHighest: Color(0xff32353c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb4cbff),
      surfaceTint: Color(0xffaec6ff),
      onPrimary: Color(0xff001538),
      primaryContainer: Color(0xff508efd),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb6cbfb),
      onSecondary: Color(0xff001538),
      secondaryContainer: Color(0xff7c90be),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3b5ff),
      onTertiary: Color(0xff2b0039),
      tertiaryContainer: Color(0xffc46fdb),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11131a),
      onSurface: Color(0xfffbfaff),
      onSurfaceVariant: Color(0xffc6cada),
      outline: Color(0xff9ea2b1),
      outlineVariant: Color(0xff7e8391),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2eb),
      inversePrimary: Color(0xff004597),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff00102e),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff003375),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff00102e),
      secondaryFixedDim: Color(0xffb2c6f7),
      onSecondaryFixedVariant: Color(0xff20355d),
      tertiaryFixed: Color(0xfffbd7ff),
      onTertiaryFixed: Color(0xff23002f),
      tertiaryFixedDim: Color(0xfff1afff),
      onTertiaryFixedVariant: Color(0xff5e0077),
      surfaceDim: Color(0xff11131a),
      surfaceBright: Color(0xff373940),
      surfaceContainerLowest: Color(0xff0b0e14),
      surfaceContainerLow: Color(0xff191b22),
      surfaceContainer: Color(0xff1d1f26),
      surfaceContainerHigh: Color(0xff272a31),
      surfaceContainerHighest: Color(0xff32353c),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffaec6ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb4cbff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffbfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb6cbfb),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff3b5ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11131a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffbfaff),
      outline: Color(0xffc6cada),
      outlineVariant: Color(0xffc6cada),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2eb),
      inversePrimary: Color(0xff00285e),
      primaryFixed: Color(0xffdee6ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb4cbff),
      onPrimaryFixedVariant: Color(0xff001538),
      secondaryFixed: Color(0xffdee6ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb6cbfb),
      onSecondaryFixedVariant: Color(0xff001538),
      tertiaryFixed: Color(0xfffdddff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff3b5ff),
      onTertiaryFixedVariant: Color(0xff2b0039),
      surfaceDim: Color(0xff11131a),
      surfaceBright: Color(0xff373940),
      surfaceContainerLowest: Color(0xff0b0e14),
      surfaceContainerLow: Color(0xff191b22),
      surfaceContainer: Color(0xff1d1f26),
      surfaceContainerHigh: Color(0xff272a31),
      surfaceContainerHighest: Color(0xff32353c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(colorScheme.primary),
            foregroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
          ),
        ),
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  // getStartedContainerColor
  static const getStartedContainerColor = ExtendedColor(
    seed: Color(0xff003663),
    value: Color(0xff003663),
    light: ColorFamily(
      color: Color(0xff004ca7),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff194573),
      onColorContainer: Color(0xffc6ddff),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff004ca7),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff194573),
      onColorContainer: Color(0xffc6ddff),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff004ca7),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff194573),
      onColorContainer: Color(0xffc6ddff),
    ),
    dark: ColorFamily(
      color: Color(0xff003663),
      onColor: Color(0xff00315b),
      colorContainer: Color(0xff002d54),
      onColorContainer: Color(0xff95bbf0),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff003663),
      onColor: Color(0xff00315b),
      colorContainer: Color(0xff002d54),
      onColorContainer: Color(0xff95bbf0),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff003663),
      onColor: Color(0xff00315b),
      colorContainer: Color(0xff002d54),
      onColorContainer: Color(0xff95bbf0),
    ),
  );

  List<ExtendedColor> get extendedColors => [getStartedContainerColor];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
