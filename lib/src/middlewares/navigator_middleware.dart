import 'package:flutter/material.dart';

class NavigatorMiddleware {
  static void pushScreen(context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void popScreen(context) {
    Navigator.of(context).pop(context);
  }
}
