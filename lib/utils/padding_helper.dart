import 'package:flutter/material.dart';

Widget withPadding(Widget child, {bool horizontalOnly = false}) {
  return Padding(
    padding: horizontalOnly
        ? const EdgeInsets.symmetric(horizontal: 20.0)
        : const EdgeInsets.all(20.0),
    child: child,
  );
}
