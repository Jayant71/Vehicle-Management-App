// import 'package:flutter/material.dart';
// import 'package:vehicle_management_app/core/config/constants/sample_vehicle_data.dart';
// import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';
// import 'package:vehicle_management_app/presentation/widgets/vehicle_card.dart';

// class VehicleListPage extends StatelessWidget implements PreferredSizeWidget {
//   const VehicleListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CommonAppBar(title: "Vehicles"),
//       body: ListView.builder(
//         itemCount: sampleVehicleData.length,
//         itemBuilder: (context, index) {
//           return VehicleWidget(
//             vehicle: sampleVehicleData[index],
//             onTap: () {
//               // Navigate to vehicle details page
//             },
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(55.0);
// }
