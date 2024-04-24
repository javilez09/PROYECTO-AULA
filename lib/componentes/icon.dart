import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Icono extends StatelessWidget {
  const Icono({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('lib/assets/detengase.png', height: 120),
    );
  }
}
