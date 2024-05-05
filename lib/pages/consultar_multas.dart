import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../componentes/infracciones_tile.dart';
import '../componentes/my_drawer.dart';
import '../models/infracciones.dart';

class ConsultarMulta extends StatefulWidget {
  const ConsultarMulta({super.key});

  @override
  State<ConsultarMulta> createState() => _ConsultarMultaState();
}

class _ConsultarMultaState extends State<ConsultarMulta> {
  final user = FirebaseAuth.instance.currentUser;
  List<Infracciones> listaInfracciones = [];

  @override
  void initState() {
    super.initState();
    cargarDatosDesdeFirestore();
  }

  void cargarDatosDesdeFirestore() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore
        .collection('infracciones')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listaInfracciones.add(Infracciones(
          nombreCientifico: doc['numero'],
          nombre: doc['tipo'],
          codigo: doc['valor'],
        ));
      });
      setState(() {});
    }).catchError((error) {
      print("Error al obtener datos de Firestore: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("Consultar Multas")),
      ),
      drawer: const MyDrawer(),
      body: Column(children: [
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Buscar aqui...",
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: listaInfracciones.length,
            itemBuilder: (context, index) {
              return PlantaTile(
                infraccion: listaInfracciones[index],
                onTap: () {},
              );
            },
          ),
        ),
      ]),
    );
  }
}
