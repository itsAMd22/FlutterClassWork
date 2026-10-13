import 'package:flutter/material.dart';
import 'package:project_3/pages/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',
            style: TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: Colors.amberAccent,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Text(
              'Stay focused,\nkeep building.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
          ),
          
          const SizedBox(height: 20),

          // Cards
          BannerCard(
            title: 'Stay focused', 
            subtitle: 'Tap for today\'s plan', 
            onTap: () {}
          ),
          
          BannerCard(
            title: 'Contest', 
            subtitle: 'Saturday, 8 PM', 
            dark: false, 
            onTap: () {}
          ),
        ],
      ),
    );
  }
}