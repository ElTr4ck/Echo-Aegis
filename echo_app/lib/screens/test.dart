import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                _buildButtonGrid(),
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
        SvgPicture.network(
          '/placeholder.svg?height=100&width=100',
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 10),
        const Text(
          'StoryTime',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Share and Listen to Amazing Stories',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF666666),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButtonGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        _buildButton(Icons.headphones, 'Listen to Stories'),
        _buildButton(Icons.mic, 'Tell Your Story'),
        _buildButton(Icons.book, 'My Library'),
        _buildButton(Icons.person, 'My Profile'),
      ],
    );
  }

  Widget _buildButton(IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF4a90e2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Featured Story',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              '/placeholder.svg?height=200&width=300',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            '"The Adventure of a Lifetime" by Mary Johnson',
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