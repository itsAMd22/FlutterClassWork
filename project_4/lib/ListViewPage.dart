import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List items = [
      {
        'title': 'Android',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Android_robot_%282014-2019%29.svg'
      },
      {
        'title': 'Python',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Python-logo-notext.svg'
      },
      {
        'title': 'C++',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/1/18/ISO_C%2B%2B_Logo.svg'
      },
      {
        'title': 'PHP',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/2/27/PHP-logo.svg'
      },
      {
        'title': 'Ruby',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/7/73/Ruby_logo.svg'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewPage'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  padding: const EdgeInsets.all(12),
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}