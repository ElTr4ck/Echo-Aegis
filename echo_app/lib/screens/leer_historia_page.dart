import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReadStoriesPage extends StatelessWidget {
  const ReadStoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Read Stories',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4a90e2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Choose a story to read:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildStoryCard(
            title: 'The Adventure of a Lifetime',
            author: 'Mary Johnson',
            summary: 'A thrilling tale of exploration and discovery.',
            imagePath: '/placeholder.svg?height=100&width=100',
          ),
          const SizedBox(height: 16),
          _buildStoryCard(
            title: 'Memories of the Old Town',
            author: 'John Smith',
            summary: 'A nostalgic journey through a historic town.',
            imagePath: '/placeholder.svg?height=100&width=100',
          ),
          const SizedBox(height: 16),
          _buildStoryCard(
            title: 'A Day at the Beach',
            author: 'Sarah Brown',
            summary: 'A relaxing story of sun, sand, and sea.',
            imagePath: '/placeholder.svg?height=100&width=100',
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCard({
    required String title,
    required String author,
    required String summary,
    required String imagePath,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navigate to story reading page
        },
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
                        const SizedBox(height: 8),
                        Text(
                          summary,
                          style: const TextStyle(fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to story reading page
                  },
                  child: const Text(
                    'Read Story',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF4a90e2),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReadStoryPage extends StatelessWidget {
  final String title;
  final String author;
  final String content;

  const ReadStoryPage({
    Key? key,
    required this.title,
    required this.author,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4a90e2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'By $author',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 20, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}