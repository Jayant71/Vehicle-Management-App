import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';
import 'package:vehicle_management_app/presentation/pages/reviewapplication/reviewapplicationpage.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';

class VehicleRequestForm extends StatefulWidget {
  const VehicleRequestForm({super.key, required this.uid});

  final String uid;

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
            const Text('\tEnter source'),
            sourceField(),
            const SizedBox(height: 15),
            const Text('\tEnter destination'),
            destinationField(),
            const SizedBox(height: 15),
            isRoundTripCheckbox(),
            const SizedBox(height: 15),
            vehicleDropdown(),
            const SizedBox(height: 15),
            const Text("Select Date of Travel"),
            dateField(),
            const SizedBox(height: 15),
            const Text("Select Time of Travel"),
            timeField(),
            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                const uuid = Uuid();
                UserApplication application = UserApplication(
                  bookingId: uuid.v4(),
                  sourceName: sourceController.text,
                  destinationName: destinationController.text,
                  sourceCoordinates: const [0.0, 0.0].toString(),
                  destinationCoordinates: const [0.0, 0.0].toString(),
                  date: dateController.text,
                  time: timeController.text,
                  accepted: 'false',
                  driverId: '',
                  vehicleId: vehicleName,
                  createdAt: DateTime.now().toString(),
                  roundTrip: isRoundTrip.toString(),
                  userId: widget.uid,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewApplicationPage(
                      application: application,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.preview),
              label: const Text('Preview'),
            ),
          ],
        ));
  }

  Widget sourceField() {
    return TextFormField(
        controller: sourceController,
        readOnly: true,
        onTap: () => {},
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
        ));
  }

  Widget destinationField() {
    return TextField(
      controller: destinationController,
      readOnly: true,
      onTap: () => {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }

  Widget isRoundTripCheckbox() {
    return CheckboxListTile(
      title: const Text('Round Trip?'),
      value: isRoundTrip,
      onChanged: (value) {
        setState(() {
          isRoundTrip = value!;
        });
      },
    );
  }

  Widget vehicleDropdown() {
    return DropdownButtonFormField2(
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
      ),
      decoration: InputDecoration(
        labelText: 'Select a Vehicle',
        labelStyle: const TextStyle(fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
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
      isExpanded:
          false, // Set isExpanded to false to limit the width of the dropdown menu
      // Set dropdownWidth to a custom value to limit the width of the dropdown menu
    );
  }

  Widget dateField() {
    return TextField(
      enabled: true,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          // lastDate: DateTime.now().add(const Duration(days: 7)),
          lastDate: DateTime(2030, 12, 31),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              dateController.text = selectedDate.toString().split(' ')[0];
            });
          }
        });
      },
      controller: dateController,
      readOnly: true,
      decoration: const InputDecoration(
        hintText: 'Date',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  Widget timeField() {
    return TextField(
      controller: timeController,
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((selectedTime) {
          if (selectedTime != null) {
            setState(() {
              timeController.text = selectedTime.format(context);
            });
          }
        });
      },
      readOnly: true,
      decoration: const InputDecoration(
        hintText: 'Time',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
