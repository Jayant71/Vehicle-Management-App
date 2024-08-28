import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signout.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
import 'package:vehicle_management_app/service_locator.dart';

class ProfileScreenPage extends StatelessWidget implements PreferredSizeWidget {
  const ProfileScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('Profile',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Details',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildProfileDetailRow('Email', 'johndoe@example.com', Icons.email),
            const SizedBox(height: 12.0),
            _buildProfileDetailRow('Phone', '+1 234 567 8900', Icons.phone),
            const SizedBox(height: 12.0),
            _buildEditableProfileDetailRow(
                'Address', 'Enter your address', Icons.home),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // _signout(context);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetailRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24.0),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableProfileDetailRow(
      String label, String hint, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8.0),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }

  _signout(BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    var result = await sl<SignoutUseCase>().call();
    result.fold(
      (l) {
        Future.delayed(const Duration(seconds: 1), () {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(result.fold(
                (l) => l.toString(),
                (r) => r.toString(),
              )),
            ));
            log(result.toString());
            // timeCubit.stopTimer();
            Navigator.pop(context);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const GetStartedPage(),
              ),
            );
          }
        });
      },
      (r) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(result.fold(
            (l) => l.toString(),
            (r) => r.toString(),
          )),
        ));
        log(result.toString());
        Navigator.pop(context);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
