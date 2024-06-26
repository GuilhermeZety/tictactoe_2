import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/extensions/color_extension.dart';
import 'package:tictactoe/app/core/common/utils/overlay_ui_utils.dart';
import 'package:tictactoe/main.dart';

/// > A class that contains all the colors used in the app
class AppTheme {
  //SingleTon
  AppTheme._();
  static final AppTheme _instance = AppTheme._();
  factory AppTheme() => AppTheme._instance;
  //

  late Signal<ThemeMode> themeMode;
  void init() {
    var value = session.prefs.getBoolean('theme');

    if (value == null) {
      themeMode = ThemeMode.dark.toSignal();
      return;
    }
    if (value == true) {
      themeMode = ThemeMode.dark.toSignal();
      return;
    }
    themeMode = ThemeMode.light.toSignal();
  }

  Future invertThemeMode() async {
    themeMode.value = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await session.prefs.setBoolean('theme', themeMode.value == ThemeMode.dark);
    OverlayUIUtils.setOverlayStyle(barDark: themeMode.value != ThemeMode.dark);
  }

  static ThemeData get dark => ThemeData(
        fontFamily: AppFonts.defaultFont,
        primarySwatch: AppColors.primary.toMaterialColor(),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.primary,
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary.withOpacity(0.2),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.white, fontWeight: AppFonts.bold),
          titleMedium: TextStyle(color: AppColors.grey_200, fontWeight: AppFonts.semiBold),
          titleSmall: TextStyle(color: AppColors.grey_300, fontWeight: AppFonts.normal),
          displayLarge: TextStyle(color: AppColors.grey_300, letterSpacing: 0.4),
          displayMedium: TextStyle(color: AppColors.grey_300, letterSpacing: 0.4),
          bodyMedium: TextStyle(color: AppColors.grey_300, letterSpacing: 0.4),
          bodySmall: TextStyle(color: AppColors.grey_400, letterSpacing: 0.4),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.grey_200,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppColors.blue_800,
        canvasColor: AppColors.blue_700,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primary,
          primaryContainer: AppColors.blue_700,
          secondary: AppColors.primary,
          surface: AppColors.blue_700,
          error: AppColors.error,
        ),
        datePickerTheme: const DatePickerThemeData(
          backgroundColor: AppColors.blue_800,
          dayStyle: TextStyle(
            color: AppColors.grey_200,
          ),
          surfaceTintColor: Colors.transparent,
          headerHelpStyle: TextStyle(
            color: AppColors.grey_300,
            fontSize: 16,
            fontWeight: AppFonts.bold,
          ),
        ),
      ).copyWith(
        disabledColor: AppColors.blue_600,
        inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          prefixIconColor: AppColors.grey_200,
          labelStyle: const TextStyle(
            color: AppColors.grey_200,
            fontSize: 16,
            fontWeight: AppFonts.bold,
          ),
          hintStyle: const TextStyle(
            color: AppColors.grey_500,
            fontSize: 16,
            fontWeight: AppFonts.semiBold,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.primary.withOpacity(0.7),
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          //DISABLE  ------
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          //ERROR  ------
          errorStyle: TextStyle(
            fontWeight: AppFonts.bold,
            color: AppColors.error.withOpacity(0.5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.error,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: AppColors.error,
            ),
          ),
        ),
      );

  static ThemeData get light => ThemeData(
        fontFamily: AppFonts.defaultFont,
        primarySwatch: AppColors.primary.toMaterialColor(),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.primary,
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary.withOpacity(0.2),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.black, fontWeight: AppFonts.bold),
          titleMedium: TextStyle(color: AppColors.grey_800, fontWeight: AppFonts.semiBold),
          titleSmall: TextStyle(color: AppColors.grey_700, fontWeight: AppFonts.normal),
          displayLarge: TextStyle(color: AppColors.grey_700, letterSpacing: 0.4),
          displayMedium: TextStyle(color: AppColors.grey_700, letterSpacing: 0.4),
          bodyMedium: TextStyle(color: AppColors.grey_700, letterSpacing: 0.4),
          bodySmall: TextStyle(color: AppColors.grey_600, letterSpacing: 0.4),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.grey_700,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppColors.grey_100,
        canvasColor: AppColors.white,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primary,
          primaryContainer: Colors.white,
          secondary: AppColors.primary,
          surface: AppColors.blue_700,
          error: AppColors.error,
        ),
        datePickerTheme: const DatePickerThemeData(
          backgroundColor: AppColors.white,
          dayStyle: TextStyle(
            color: AppColors.grey_800,
          ),
          surfaceTintColor: Colors.transparent,
          headerHelpStyle: TextStyle(
            color: AppColors.grey_700,
            fontSize: 16,
            fontWeight: AppFonts.bold,
          ),
        ),
      ).copyWith(
        disabledColor: AppColors.blue_600,
        inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          prefixIconColor: AppColors.grey_800,
          labelStyle: const TextStyle(
            color: AppColors.grey_800,
            fontSize: 16,
            fontWeight: AppFonts.bold,
          ),
          hintStyle: const TextStyle(
            color: AppColors.grey_300,
            fontSize: 16,
            fontWeight: AppFonts.semiBold,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.primary.withOpacity(0.7),
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          //DISABLE  ------
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          //ERROR  ------
          errorStyle: TextStyle(
            fontWeight: AppFonts.bold,
            color: AppColors.error.withOpacity(0.5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.error,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: AppColors.error,
            ),
          ),
        ),
      );
}
