import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Future init() async {
    await dotenv.load(fileName: '.env');

    sharedKey = dotenv.env['SHARED_KEY']!;
  }

  static late String sharedKey;

  static String get(String name) => dotenv.env[name]!;
}
