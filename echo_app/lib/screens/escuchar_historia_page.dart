import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListenStoriesPage extends StatelessWidget {
  const ListenStoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listen to Stories',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4a90e2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Choose a story to listen to:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildStoryCard(
            title: 'The Adventure of a Lifetime',
            author: 'Mary Johnson',
            duration: '15 minutes',
            imagePath: '/placeholder.svg?height=100&width=100',
          ),
          const SizedBox(height: 16),
          _buildStoryCard(
            title: 'Memories of the Old Town',
            author: 'John Smith',
            duration: '20 minutes',
            imagePath: '/placeholder.svg?height=100&width=100',
          ),
          const SizedBox(height: 16),
          _buildStoryCard(
            title: 'A Day at the Beach',
            author: 'Sarah Brown',
            duration: '10 minutes',
            imagePath: '/placeholder.svg?height=100&width=100',
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCard({
    required String title,
    required String author,
    required String duration,
    required String imagePath,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.network(
                    imagePath,
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'By $author',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Duration: $duration',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildAudioPlayer(),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioPlayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous),
          iconSize: 36,
          onPressed: () {
            // Handle previous
          },
        ),
        IconButton(
          icon: const Icon(Icons.play_arrow),
          iconSize: 48,
          onPressed: () {
            // Handle play/pause
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          iconSize: 36,
          onPressed: () {
            // Handle next
          },
        ),
      ],
    );
  }
}