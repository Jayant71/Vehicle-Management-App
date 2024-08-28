import 'package:flutter/material.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';

class ApplicationListPage extends StatelessWidget
    implements PreferredSizeWidget {
  const ApplicationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('Applications',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: const Center(
        child: Text('Application List Page'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
