import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // 1. Profile Picture Avatar
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height: 16),

            // 2. Name & Secondary Details
            const Text(
              'Mohammed Arif',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),
            
            const Text(
              'm0.arif.2205@gmail.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            const Divider(),
            
            const SizedBox(height: 10),

            // 3. User Detail Tiles
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Department'),
              subtitle: const Text('CSE 64B'),
            ),
            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text('Role'),
              subtitle: const Text('Student / Developer'),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Action to edit profile
              },
            ),
          ],
        ),
      ),
    );
  }
}