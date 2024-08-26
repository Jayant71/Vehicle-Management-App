import 'package:flutter/material.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';

class VehicleRequestForm extends StatefulWidget {
  const VehicleRequestForm({super.key});

  @override
  State<VehicleRequestForm> createState() => _VehicleRequestFormState();
}

class _VehicleRequestFormState extends State<VehicleRequestForm> {
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String vehicleName = 'Vehicle 1';
  bool isRoundTrip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: 'Vehicle Request Form',
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: [
            // const Text('Vehicle Request Form'),
            sourceField(),
            destinationField(),
            isRoundTripCheckbox(),
            vehicleDropdown(),
            dateField(),
            timeField(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.preview),
              label: const Text('Preview'),
            ),
          ],
        ));
  }

  Widget sourceField() {
    return GestureDetector(
      onTap: () {},
      child: TextFormField(
          controller: sourceController,
          enabled: false,
          decoration: InputDecoration(
            label: const Text('Source'),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 2),
            ),
          )),
    );
  }

  Widget destinationField() {
    return GestureDetector(
      onTap: () {},
      child: const TextField(
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Destination',
        ),
      ),
    );
  }

  Widget isRoundTripCheckbox() {
    return CheckboxListTile(
      title: const Text('Round Trip'),
      value: isRoundTrip,
      onChanged: (value) {
        setState(() {
          isRoundTrip = value!;
        });
      },
    );
  }

  Widget vehicleDropdown() {
    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
          value: 'Vehicle 1',
          child: Text('Vehicle 1'),
        ),
        DropdownMenuItem(
          value: 'Vehicle 2',
          child: Text('Vehicle 2'),
        ),
      ],
      onChanged: (value) {
        vehicleName = value.toString();
      },
    );
  }

  Widget dateField() {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 7)),
        );
      },
      child: TextField(
        enabled: false,
        controller: dateController,
        decoration: const InputDecoration(
          hintText: 'Date',
        ),
      ),
    );
  }

  Widget timeField() {
    return GestureDetector(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
      },
      child: TextField(
        controller: timeController,
        enabled: false,
        decoration: const InputDecoration(
          hintText: 'Time',
        ),
      ),
    );
  }
}
