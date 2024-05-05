import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../componentes/my_drawer.dart';

class AddMulta extends StatelessWidget {
  AddMulta({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
            child: Text(
          "Añadir Multa",
        )),
      ),
      drawer: const MyDrawer(),
    );
  }
}
