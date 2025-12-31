import 'package:flutter/material.dart';

// sayfa arka plan renk geçişleri

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3A1C5A),
            Color.fromARGB(255, 24, 12, 36),
            Color.fromARGB(255, 7, 7, 11),
          ],
          stops: [0.0, 0.45, 0.9],
        ),
      ),
      child: child,
    );
  }
}
