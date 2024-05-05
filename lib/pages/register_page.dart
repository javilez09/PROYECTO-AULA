import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/componentes/icon.dart';
import 'package:login/componentes/my_textfield.dart';
import 'package:login/componentes/signin_button.dart';
import 'package:login/componentes/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Editores de control de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registrarse() async {
    if (passwordController.text != confirmPasswordController.text) {
      mostrarDialogoContrasenasNoCoinciden();
      return; // Detiene la ejecución si las contraseñas no coinciden
    }

    // Muestra el indicador de progreso
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Intenta crear un nuevo usuario
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      // Cierra el indicador de progreso
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // Maneja los errores específicos de FirebaseAuth
      if (e.code == 'weak-password') {
        mostrarDialogo('La contraseña es demasiado débil');
      } else if (e.code == 'email-already-in-use') {
        mostrarDialogo('El correo electrónico ya está en uso');
      } else {
        mostrarDialogo('Ocurrió un error al registrarse');
      }
      return; // Detiene la ejecución después de manejar el error
    }

    // Navega a la pantalla de inicio de sesión o muestra un mensaje de éxito
    mostrarDialogoRegistroExitoso();
  }

  void mostrarDialogo(String mensaje) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 244, 244, 245),
        title: Center(
          child: Text(
            mensaje,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void mostrarDialogoContrasenasNoCoinciden() {
    mostrarDialogo('Las contraseñas no coinciden');
  }

  void mostrarDialogoRegistroExitoso() {
    mostrarDialogo('Registro exitoso');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icono(),
                  const SizedBox(height: 50),
                  Text(
                    'Create una cuenta',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Usuario o correo electronico',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirma contraseña',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    text: "Registrate",
                    onTap: registrarse,
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.8,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "O",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.8,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ya tienes cuenta?",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Ingresa",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
