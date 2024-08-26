import 'package:flutter/material.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';

class VehicleDashboardPage extends StatelessWidget {
  const VehicleDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: 'Vehicle Dashboard'),
      body: Center(
        child: Text('Vehicle Dashboard Page'),
      ),
    );
  }
}
