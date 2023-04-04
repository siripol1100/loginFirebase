import 'package:flutter/material.dart';
import 'package:loginfirebase/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:loginfirebase/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:loginfirebase/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:loginfirebase/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
      outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElavatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData dartTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.dartTextTheme,
      outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElavatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme);
}
