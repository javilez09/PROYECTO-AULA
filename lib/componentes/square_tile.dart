import 'package:flutter/material.dart';
import 'package:login/services/auth_service.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({super.key, required});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SignInButton(
      Buttons.google,
      text: "Iniciar sesion con Google",
      onPressed: () {
        AuthService().signInWithGoogle();
      },
    ));
  }
}
