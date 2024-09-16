import 'package:flutter/material.dart';
import 'package:vehicle_management_app/domain/usecases/auth/get_user.dart';
import 'package:vehicle_management_app/service_locator.dart';

class ProfileScreenPage extends StatelessWidget implements PreferredSizeWidget {
  ProfileScreenPage({super.key});

  final currentUser = sl<GetUserUseCase>().call();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage(
              //     'assets/profile_picture.png'), // Replace with actual image asset
            ),
            const SizedBox(height: 16.0),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24.0),
            _buildProfileDetailCard('Phone', '+1 234 567 8900', Icons.phone),
            _buildProfileDetailCard(
                'Address', '123 Main St, Springfield', Icons.home),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 12.0),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetailCard(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
