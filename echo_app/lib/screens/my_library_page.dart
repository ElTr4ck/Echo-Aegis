import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyLibraryPage extends StatelessWidget {
  const MyLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Library',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF4a90e2),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Listened Stories'),
              Tab(text: 'My Stories'),
            ],
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            _buildListenedStoriesTab(),
            _buildMyStoriesTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildListenedStoriesTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildStoryCard(
          title: 'The Adventure of a Lifetime',
          author: 'Mary Johnson',
          lastListened: '2 days ago',
          imagePath: '/placeholder.svg?height=100&width=100',
          isUserStory: false,
        ),
        const SizedBox(height: 16),
        _buildStoryCard(
          title: 'Memories of the Old Town',
          author: 'John Smith',
          lastListened: '1 week ago',
          imagePath: '/placeholder.svg?height=100&width=100',
          isUserStory: false,
        ),
        const SizedBox(height: 16),
        _buildStoryCard(
          title: 'A Day at the Beach',
          author: 'Sarah Brown',
          lastListened: '3 weeks ago',
          imagePath: '/placeholder.svg?height=100&width=100',
          isUserStory: false,
        ),
      ],
    );
  }

  Widget _buildMyStoriesTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildStoryCard(
          title: 'My First Job Experience',
          author: 'You',
          lastListened: 'Created 1 month ago',
          imagePath: '/placeholder.svg?height=100&width=100',
          isUserStory: true,
        ),
        const SizedBox(height: 16),
        _buildStoryCard(
          title: 'The Day I Met My Spouse',
          author: 'You',
          lastListened: 'Created 2 months ago',
          imagePath: '/placeholder.svg?height=100&width=100',
          isUserStory: true,
        ),
      ],
    );
  }

  Widget _buildStoryCard({
    required String title,
    required String author,
    required String lastListened,
    required String imagePath,
    required bool isUserStory,
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
                        lastListened,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement listen/re-listen functionality
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: Text(isUserStory ? 'Listen' : 'Re-listen'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF4a90e2),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
                if (isUserStory)
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement edit functionality
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}