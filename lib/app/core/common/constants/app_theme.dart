import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/extensions/color_extension.dart';
import 'package:tictactoe/app/core/common/utils/overlay_ui_utils.dart';

/// > A class that contains all the colors used in the app
class AppTheme {
  //SingleTon
  AppTheme._();
  static final AppTheme _instance = AppTheme._();
  factory AppTheme() => AppTheme._instance;
  //

  final themeMode = ThemeMode.dark.toSignal();
  void invertThemeMode() {
    themeMode.value = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
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
        ),
        iconTheme: const IconThemeData(
          color: AppColors.grey_200,
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.blue_800,
        canvasColor: AppColors.blue_700,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primary,
          primaryContainer: Colors.white,
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
            fontWeight: AppFonts.normal,
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
