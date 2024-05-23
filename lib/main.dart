// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/app_module.dart';
import 'package:tictactoe/app/app_widget.dart';
import 'package:tictactoe/app/core/shared/current_session.dart';

CurrentSession session = CurrentSession();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await session.init();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

//656783012368-85c7rdc26r9gdt4l7s5bbjfqrduhqvb0.apps.googleusercontent.com