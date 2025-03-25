import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppTheme {
  static const String fontKalameh = 'kalameh';

  static ThemeData lightTheme() {
    BorderRadius borderRadius = BorderRadius.circular(7.5);
    SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: Colors.red, statusBarBrightness: Brightness.dark);
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AColors.background,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AColors.background),
      ),
      // Text theme

      textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AColors.foreground,
              height: 1,
              fontFamily: fontKalameh),
          bodyLarge: TextStyle(
              fontSize: 15, color: AColors.foreground, height: 1, fontFamily: fontKalameh),
          bodyMedium: TextStyle(
              fontSize: 13,
              color: AColors.foreground,
              fontWeight: FontWeight.bold,
              height: 1,
              fontFamily: fontKalameh),
          bodySmall: TextStyle(
              fontSize: 11, color: AColors.foreground, height: 1, fontFamily: fontKalameh),
          headlineLarge: TextStyle(
              fontSize: 16,
              height: 1.0,
              fontWeight: FontWeight.bold,
              color: AColors.foreground,
              fontFamily: fontKalameh),
          headlineMedium: TextStyle(
              fontSize: 15, height: 1.0, color: AColors.foreground, fontFamily: fontKalameh),
          headlineSmall: TextStyle(
              fontSize: 15,
              color: AColors.foreground,
              height: 1,
              fontFamily: fontKalameh,
              letterSpacing: -.2)),
      primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: fontKalameh),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AColors.foreground,
        foregroundColor: AColors.foreground,
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: AColors.dropDownBackgroundColor,
        filled: true,
        contentPadding:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 13),
        helperStyle: const TextStyle(color: Colors.grey),
        prefixStyle: const TextStyle(color: Colors.grey),
        suffixStyle: const TextStyle(color: Colors.grey),
        hintStyle: TextStyle(
          fontFamily: fontKalameh,
          fontSize: 13,
          height: 1,
          color: const Color(0xff595f6b),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1,
            color: AColors.textFieldBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(width: 1, color: AColors.textFieldBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(width: 1, color: AColors.textFieldBorderColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(width: 4, color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
              width: 4,
              // color: AColors.textFieldBorderColor,
              color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(width: 1, color: AColors.textFieldBorderColor),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AColors.elevatedButton,
        ),
      ),
    );
  }

  static ThemeData darkTheme({String? font}) {
    BorderRadius borderRadius = BorderRadius.circular(7.5);
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AColors.background,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      // textTheme
      textTheme: ThemeData.dark().textTheme.copyWith(
          titleLarge: TextStyle(
              fontSize: 16,
              color: AColors.foreground,
              height: 1,
              fontWeight: FontWeight.bold,
              fontFamily: fontKalameh),
          bodyLarge: TextStyle(
              fontSize: 15, height: 1, color: AColors.foreground, fontFamily: fontKalameh),
          bodyMedium: TextStyle(
              fontSize: 13,
              height: 1,
              fontWeight: FontWeight.bold,
              fontFamily: fontKalameh,
              color: AColors.foreground),
          bodySmall: TextStyle(
              fontSize: 11, height: 1, color: AColors.foreground, fontFamily: fontKalameh),
          headlineLarge: TextStyle(
              fontSize: 16,
              height: 1.0,
              fontWeight: FontWeight.bold,
              color: AColors.foreground,
              fontFamily: fontKalameh),
          headlineMedium: TextStyle(
              fontSize: 15, height: 1.0, color: AColors.foreground, fontFamily: fontKalameh),
          headlineSmall: TextStyle(
              fontSize: 15,
              height: 1,
              color: AColors.foreground,
              fontFamily: fontKalameh,
              letterSpacing: -.2)),
      primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: fontKalameh),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AColors.foreground,
        foregroundColor: AColors.foreground,
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: AColors.background,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        counterStyle: const TextStyle(color: Colors.grey),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 30),
        helperStyle: const TextStyle(color: Colors.grey),
        prefixStyle: const TextStyle(color: Colors.grey),
        suffixStyle: const TextStyle(color: Colors.grey),
        hintStyle: TextStyle(
          fontFamily: fontKalameh,
          fontSize: 13,
          height: 1,
          color: const Color(0xff595f6b),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1,
            color: AColors.textFieldBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1,
            color: AColors.textFieldBorderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 4,
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(width: 4, color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(width: 1, color: AColors.textFieldBorderColor),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AColors.elevatedButton,
        ),
      ),
    );
  }
}

