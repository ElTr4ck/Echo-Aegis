import 'package:echo_app/screens/hablando_historia_page.dart';
import 'package:echo_app/screens/tema_sobre_hablar_page.dart';
import 'package:flutter/material.dart';
import 'package:echo_app/theme/colors.dart'; // Importacion de los colores
import 'screens/escuchar_historia_page.dart';
import 'screens/contar_historia_page.dart';

void main() {
  runApp(const EchoApp());
}

class EchoApp extends StatelessWidget {
  const EchoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echo',
      //Rutas de la app
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/contarHistoria': (context) => ContarHistoriaPage(),
        '/escucharHistoria': (context) => EscucharHistoriaPage(),
        '/temaParaHablar': (context) => TemaParaHablar(),
        '/hablandoHistoria': (context) => CuentaHistoriaPage(),
      },

      //Tema de la app
      theme: ThemeData(
        primaryColor: AppColors.primary,
        hintColor: AppColors.accent,
        backgroundColor: AppColors.background,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: AppColors.textPrimary),
          headline1: TextStyle(fontFamily: 'Artifika', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('lib/assets/images/logo-no-background.png', height: 40),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido a Echo',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Artifika',
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 60),

              //Botones
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/contarHistoria');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(fontSize: 24),
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                  child: const Text('Contar Historia')
              ),

              const SizedBox(height: 60),

              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/escucharHistoria');
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: const TextStyle(fontSize: 24),
                      backgroundColor: AppColors.accent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      )
                  ),
                  child: const Text('Escuchar Historia')
              ),

            ],
          ),
        ),
      )
    );
  }
}

