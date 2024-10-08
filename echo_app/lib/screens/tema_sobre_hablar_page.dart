import 'package:echo_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:echo_app/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';

class TemaParaHablar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingresa el tema sobre el que quieras hablar',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Artifika',
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40,),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade300, // Color gris claro
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Quiero hablar sobre...",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Fondo blanco para la caja de texto
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none, // Sin borde visible
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue), // Color de borde al hacer foco
                  ),
                ),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}