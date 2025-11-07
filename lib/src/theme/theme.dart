import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/theme/color/dark_color.dart';
import 'package:flutter_news_app/src/theme/color/lightColor.dart';

class AppTheme {
  const AppTheme();

  // 🌞 LIGHT THEME
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: LightColor.background,
    primaryColor: LightColor.purple,

    // Use CardThemeData (new expected type) instead of CardTheme
    cardTheme: CardThemeData(
      color: LightColor.background,
      surfaceTintColor: Colors.transparent,
    ),

    iconTheme: IconThemeData(color: LightColor.lightblack),
    dividerColor: LightColor.lightGrey,
    disabledColor: LightColor.darkgrey,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: LightColor.purple,
      onPrimary: LightColor.Darker,
      secondary: LightColor.lightBlue,
      onSecondary: LightColor.background,
      tertiary: LightColor.lightpurple,
      onTertiary: LightColor.background,
      error: Colors.red,
      onError: LightColor.titleTextColor,
      background: LightColor.background,
      onBackground: LightColor.titleTextColor,
      surface: LightColor.background,
      onSurface: LightColor.Darker,
    ),

    // Use BottomAppBarThemeData (new expected type) instead of BottomAppBarTheme
    bottomAppBarTheme: BottomAppBarThemeData(
      surfaceTintColor: LightColor.background,
      shadowColor: Colors.transparent,
    ),
  );

  // 🌚 DARK THEME
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: DarkColor.background,
    primaryColor: DarkColor.purple,

    cardTheme: CardThemeData(
      color: DarkColor.background,
      surfaceTintColor: Colors.transparent,
    ),

    iconTheme: IconThemeData(color: DarkColor.lightblack),
    dividerColor: DarkColor.lightblack,
    disabledColor: DarkColor.darkBlue,

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: DarkColor.purple,
      onPrimary: DarkColor.white,
      secondary: DarkColor.lightBlue,
      onSecondary: DarkColor.Darker,
      tertiary: DarkColor.brighter,
      onTertiary: DarkColor.white,
      error: Colors.red,
      onError: DarkColor.titleTextColor,
      background: DarkColor.background,
      onBackground: DarkColor.titleTextColor,
      surface: DarkColor.background,
      onSurface: DarkColor.white,
    ),

    bottomAppBarTheme: BottomAppBarThemeData(
      surfaceTintColor: DarkColor.lightblack,
      shadowColor: Colors.transparent,
    ),
  );

  // 📖 Text styles
  static const TextStyle titleStyle =
      TextStyle(color: LightColor.titleTextColor, fontSize: 16);

  static const TextStyle subTitleStyle =
      TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static const TextStyle h1Style =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle h2Style = TextStyle(fontSize: 22);
  static const TextStyle h3Style = TextStyle(fontSize: 20);
  static const TextStyle h4Style = TextStyle(fontSize: 18);
  static const TextStyle h5Style = TextStyle(fontSize: 16);
  static const TextStyle h6Style = TextStyle(fontSize: 14);
}
