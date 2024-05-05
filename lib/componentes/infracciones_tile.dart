import 'package:flutter/material.dart';
import '../models/infracciones.dart';

class PlantaTile extends StatelessWidget {
  final Infracciones infraccion;
  final void Function()? onTap;
  const PlantaTile({super.key, required this.infraccion, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(14),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            // imagen

            const SizedBox(width: 20),

            //Nombre Planta
            Expanded(
              child: Column(
                children: [
                  Text(
                    infraccion.nombre,
                  ),
                  //Nombre Cientifico
                  Text(
                    infraccion.nombreCientifico,
                  ),
                  Text(
                    infraccion.codigo,
                  ),
                ],
              ),
            ),

            //Tipo
          ],
        ),
      ),
    );
  }
}
