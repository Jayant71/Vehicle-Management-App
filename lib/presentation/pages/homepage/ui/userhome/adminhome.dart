import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Management Admin'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard section
            const Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardTile(
                          title: 'Total Vehicles',
                          value: '50',
                          icon: Icons.car_rental,
                        ),
                        DashboardTile(
                          title: 'Available Vehicles',
                          value: '25',
                          icon: Icons.check_circle,
                        ),
                        DashboardTile(
                          title: 'Maintenance Due',
                          value: '5',
                          icon: Icons.warning,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Vehicles List section
            const Text(
              'Vehicles List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10, // Replace with actual data length
              itemBuilder: (context, index) {
                // Replace with actual vehicle data
                final vehicle = 'Vehicle ${index + 1}';
                return ListTile(
                  leading: const Icon(Icons.car_rental),
                  title: Text(vehicle),
                  subtitle: const Text('Status: Available'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DashboardTile({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
