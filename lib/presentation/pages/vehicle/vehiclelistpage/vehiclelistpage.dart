import 'package:flutter/material.dart';

class VehicleListPage extends StatelessWidget implements PreferredSizeWidget {
  const VehicleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('Vehicles',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: const Center(
        child: Text('Vehicle List Page'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
