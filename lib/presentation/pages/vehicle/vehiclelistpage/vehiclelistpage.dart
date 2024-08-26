import 'package:flutter/material.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';

class VehicleListPage extends StatelessWidget {
  const VehicleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: 'Vehicle List'),
      body: Center(
        child: Text('Vehicle List Page'),
      ),
    );
  }
}
