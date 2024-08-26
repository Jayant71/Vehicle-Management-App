import 'package:flutter/material.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';

class Applications extends StatelessWidget {
  const Applications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: 'Applications'),
      body: Center(
        child: Text('Applications'),
      ),
    );
  }
}
