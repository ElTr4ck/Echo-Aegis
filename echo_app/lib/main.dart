import 'package:echo_app/screens/leer_historia_page.dart';
import 'package:echo_app/screens/my_library_page.dart';
import 'package:flutter/material.dart';
import 'package:echo_app/theme/colors.dart'; // Importacion de los colores
import 'screens/escuchar_historia_page.dart';
import 'screens/contar_historia_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        '/contarHistoria': (context) => TellStoryPage(),
        '/escucharHistoria': (context) => ListenStoriesPage(),
        '/miLibreria': (context) => MyLibraryPage(),
        '/leerHistoria': (context) => ReadStoriesPage()
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 30),
                _buildButtonGrid(context),
                const SizedBox(height: 30),
                _buildFeaturedStory(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Bienvenido a',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
            fontFamily: 'Artifika'
          ),
        ),
        const SizedBox(height: 10),
        Image.asset(
            'lib/assets/images/logo-black.png',
            width: 300,
        ),
        const SizedBox(height: 10),
        const Text(
          'Comparte y escucha historias impresionantes',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF666666),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButtonGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        _buildButton(Icons.headphones, 'Escuchar Historias', context),
        _buildButton(Icons.mic, 'Contar una Historia', context),
        _buildButton(Icons.book, 'Leer Historias', context),
        _buildButton(Icons.bookmark, 'Mi libreria', context),
      ],
    );
  }

  Widget _buildButton(IconData icon, String label, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(label == 'Contar una Historia'){
          Navigator.pushNamed(context, '/contarHistoria');
        }
        else if (label == 'Escuchar Historias'){
          Navigator.pushNamed(context, '/escucharHistoria');
        }
        else if(label == 'Mi libreria'){
          Navigator.pushNamed(context, '/miLibreria');
        }
        else if(label == 'Leer Historias'){
          Navigator.pushNamed(context, '/leerHistoria');
        }
      },
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: AppColors.secundary),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.secundary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
                fontFamily: 'Artifika'
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedStory() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secundary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          Text(
            'Historia Destacada',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.accent,
                fontFamily: 'Artifika'
            ),
          ),
          SizedBox(height: 15),
          Text(
            '"La aventura de una vida" - María (70 años)',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

