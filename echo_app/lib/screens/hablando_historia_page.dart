import 'package:echo_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:echo_app/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CuentaHistoriaPage extends StatefulWidget{
  @override
  _CuentaHistoriaPageState createState() => _CuentaHistoriaPageState();
}

class _CuentaHistoriaPageState extends State<CuentaHistoriaPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _displayText = 'Pulsa el microfono para hablar';
  String _spokenText = '';

  @override
  void initState(){
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if(!_isListening){
      bool available = await _speech.initialize();
      if(available) {
        setState(() {
          _isListening = true;
          _displayText = 'Escuchando...';
        });

        _speech.listen(onResult: (val) {
          setState(() {
            _spokenText = val.recognizedWords;
          });
        });
      }
    }
    else{
      setState(() {
        _isListening = false;
        _displayText = 'Pulsa el microfono para hablar...';
      });

      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _displayText,
                style: const TextStyle(
                  fontSize: 36,
                  fontFamily: 'Artifika',
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 20,),

              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hablas sobre: "',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Artifika',
                      ),
                    ),
                    TextSpan(
                      text: 'Historias de terror ',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 32,
                        fontFamily: 'Artifika',
                      ),
                    ),
                    TextSpan(
                      text: '"',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Artifika',
                      ),
                    )
                  ]
                ),

              ),

              const SizedBox(height: 40,),

              //Icono de microfono

              IconButton(
                  onPressed: _listen,
                  icon: Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                    size: 60,
                    color: _isListening ? AppColors.accent : Colors.black,
                  )
              ),

              const SizedBox(height: 20.0,),

              //Ondas de audio faltantes por implementar


              const SizedBox(height: 20.0,),

              const Text(
                'Trata de estar en un lugar con el menor ruido de fondo posible',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40.0,),

              ElevatedButton(
                onPressed: () {
                  _speech.stop();
                  setState(() {
                    _isListening = false;
                    _displayText = 'Pulsa el micrófono para hablar';
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('Parar'),
              ),
            ],
          ),
        ),
      )
    );
  }
}