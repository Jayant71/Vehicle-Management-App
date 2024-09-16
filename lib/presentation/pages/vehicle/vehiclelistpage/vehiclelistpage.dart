import 'package:flutter/material.dart';
import 'package:vehicle_management_app/core/config/constants/sample_vehicle_data.dart';

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
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
        ),
        body: ListView.builder(
            itemCount: sampleVehicleData.length,
            itemBuilder: (ctx, i) {
              return ListTile(
                title: Text(sampleVehicleData[i].name),
                subtitle: Text(sampleVehicleData[i].brand),
              );
            }));
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
