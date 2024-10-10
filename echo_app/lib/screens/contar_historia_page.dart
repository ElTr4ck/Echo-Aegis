import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';

class TellStoryPage extends StatefulWidget {
  const TellStoryPage({Key? key}) : super(key: key);

  @override
  _TellStoryPageState createState() => _TellStoryPageState();
}

class _TellStoryPageState extends State<TellStoryPage> {
  bool isRecording = false;
  bool isText = false;
  final TextEditingController _storyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cuenta una historia',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Artifika',
              color: AppColors.secundary
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '¡Comparte tus experiencias con el mundo!',
              style: TextStyle(fontSize: 18, color: Color(0xFF666666)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildVoiceRecordingSection(),
            //const SizedBox(height: 30),
            //_buildTextInputSection(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitStory,
              style: ElevatedButton.styleFrom(
                primary: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Enviar mi historia',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Artifika',
                    color: AppColors.secundary
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceRecordingSection() {
    return Column(
      children: [
        Text(
          isText ? 'Escribe tu historia' :'Graba tu historia',
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Artifika'
          ),
        ),
        const SizedBox(height: 15),
        isText ? _buildTextInputSection() : _buildButtonRecord(),
        if (isRecording)
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Grabando tu audio...',
              style: TextStyle(fontSize: 18, color: AppColors.accent),
            ),
          ),
      ],
    );
  }

  Widget _buildTextInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: _toggleModeText,
          style: ElevatedButton.styleFrom(
            primary: AppColors.secundary,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Prefiero grabar mi historia',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Artifika',
                color: AppColors.primary
            ),
          ),
        ),
        const SizedBox(height: 15),
        if(isText)
          TextField(
            controller: _storyController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Start typing your story here...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF4a90e2), width: 2),
              ),
            ),
            style: const TextStyle(fontSize: 18),
          ),
      ],
    );
  }

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
    // Here you would implement the actual recording logic
    if (isRecording) {
      // Start recording
      print('Started recording');
    } else {
      // Stop recording
      print('Stopped recording');
    }
  }

  Widget _buildButtonRecord(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: _toggleRecording,
          style: ElevatedButton.styleFrom(
              primary: isRecording ? AppColors.accent : AppColors.primary,
              padding: const EdgeInsets.all(80.0),
              shape: const CircleBorder()
          ),
          child: Column(
            children: [
              Icon(
                isRecording ? Icons.stop : Icons.mic,
                size: 70,
              ),
              const SizedBox(height: 10.0,),
              Text(
                isRecording ? 'Detener la grabación' : 'Empezar la grabación',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: _toggleModeText,
          style: ElevatedButton.styleFrom(
            primary: AppColors.secundary,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Prefiero escribir mi historia',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Artifika',
                color: AppColors.primary
            ),
          ),
        ),
      ],
    );
  }

  void _submitStory() {
    String textStory = _storyController.text;
    // Here you would implement the logic to submit the story
    // This could involve sending the recorded audio file (if any)
    // and/or the text story to your backend
    print('Submitting story: $textStory');
    // After submission, you might want to navigate back or show a confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your story has been submitted!')),
    );
  }

  @override
  void dispose() {
    _storyController.dispose();
    super.dispose();
  }

  void _toggleModeText(){
    setState(() {
      isText = !isText;
    });
  }
}
