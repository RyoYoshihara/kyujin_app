import 'package:flutter/material.dart';

import '../view/home_page/home_page.dart';

class Routes {
  static const String top = '/topPage';

  static const String error = '/error';
}

class RouteGenerator {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}