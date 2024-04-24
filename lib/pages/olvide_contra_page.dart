import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/componentes/icon.dart';
import 'package:login/componentes/my_textfield.dart';
import 'package:login/componentes/signin_button.dart';

class PaginadeRestablecerPassword extends StatefulWidget {
  const PaginadeRestablecerPassword({super.key});

  @override
  State<PaginadeRestablecerPassword> createState() =>
      _PaginadeRestablecerPasswordState();
}

class _PaginadeRestablecerPasswordState
    extends State<PaginadeRestablecerPassword> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future restablecerPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      notificacionReseteoContra();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Center(
              child: Text(
            'Email Incorrecto',
            style: TextStyle(color: Colors.white),
          )),
        );
      },
    );
  }

  void notificacionReseteoContra() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Center(
              child: Text(
            'Hemos enviado un correo a tu contraseña',
            style: TextStyle(color: Colors.white),
          )),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Icono(),
                const SizedBox(height: 50),
                Text(
                  'Ingresa tu correo electrónico registrado:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: 'Usuario o correo electrónico',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Restablecer contraseña",
                  onTap: restablecerPassword,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
