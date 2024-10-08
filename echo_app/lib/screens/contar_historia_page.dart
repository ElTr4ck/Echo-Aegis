import 'package:echo_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:echo_app/widgets/appbar_custom.dart';

class ContarHistoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿Qué te parece contar algo del tema del mes?',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Artifika',
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

          const SizedBox(height: 40,),

          const SizedBox(
            height: 150,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'El tema del mes es “',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontFamily: 'Artifika',
                    ),
                  ),
                  TextSpan(
                    text: 'Historias de miedo',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 36,
                      fontFamily: 'Artifika',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: '”',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontFamily: 'Artifika',
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
             ),
            ),

            const SizedBox(height: 40,),

            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/hablandoHistoria');
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(fontSize: 24),
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    )
                ),

                child: const Text('Si, contar sobre eso'),
            ),

            const SizedBox(height: 30,),

            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/temaParaHablar');
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(fontSize: 24),
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  )
              ),

              child: const Text('No, contar otra cosa'),
            )
          ]
        ),
      )
    );
  }
}
