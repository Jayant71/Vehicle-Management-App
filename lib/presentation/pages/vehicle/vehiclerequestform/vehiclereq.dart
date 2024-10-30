import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:vehicle_management_app/common/utils/picklocation.dart';
import 'package:vehicle_management_app/core/config/constants/sample_vehicle_data.dart';
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
  List<double> sourceCoordinates = [0.0, 0.0];
  List<double> destinationCoordinates = [0.0, 0.0];

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
                  sourceCoordinates: sourceCoordinates,
                  destinationCoordinates: destinationCoordinates,
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
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ReviewApplicationPage(
                        application: application,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return ScaleTransition(
                          scale: CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                          child: child,
                        );
                      },
                    ));
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
        onTap: () => {
              _pickLocation(context, sourceController, true),
            },
        decoration: InputDecoration(
          hintText: 'Pick a Source location',
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
      onTap: () => {
        _pickLocation(context, destinationController, false),
      },
      decoration: InputDecoration(
        hintText: 'Pick a Destination location',
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
        maxHeight: 300, // Set the maximum height for the dropdown
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
      ),
      decoration: InputDecoration(
        labelText: 'Select a Vehicle Preference',
        labelStyle: const TextStyle(fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      items: List.from(
        sampleVehicleData.map((vehicle) {
          return DropdownMenuItem(
              value: vehicle.name,
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Chip(
                  label: const Text(
                    // vehicle.availablity,
                    "",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: vehicle.availablity == 'Available'
                      ? Colors.green
                      : Colors.red,
                  shape: const CircleBorder(),
                ),
                const SizedBox(width: 10),
                Image.network(
                  vehicle.imageUrl,
                  height: 50,
                  width: 70,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${vehicle.brand} ${vehicle.name}' +
                        '\nRegistration: ${vehicle.registrationNumber}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ]));
        }),
      ),
      onChanged: (value) {
        setState(() {
          vehicleName = value.toString();
        });
      },
      isExpanded:
          true, // Set isExpanded to true to allow the dropdown to adjust its width
    );
  }

  Widget dateField() {
    return TextField(
      enabled: true,
      onTap: () {
        _showDatePickerWithAnimation(context);
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
      onTap: () async {
        var picked = await _showTimePickerWithAnimation(context);
        if (picked != null) {
          setState(() {
            timeController.text = picked.toString().substring(10, 15);
          });
        }
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

  void _showDatePickerWithAnimation(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Material(
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2030, 12, 31),
              onDateChanged: (selectedDate) {
                setState(() {
                  dateController.text = selectedDate.toString().split(' ')[0];
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }

  _showTimePickerWithAnimation(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: TimePickerDialog(initialTime: TimeOfDay.now())),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }

  // _pickLocation(BuildContext context) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: Colors.black54,
  //     transitionDuration: const Duration(milliseconds: 300),
  //     pageBuilder: (BuildContext buildContext, Animation animation,
  //         Animation secondaryAnimation) {
  //       return Center(
  //         child: Container(
  //           constraints: BoxConstraints(
  //             maxHeight: MediaQuery.of(context).size.height * 0.8,
  //             maxWidth: MediaQuery.of(context).size.width * 0.9,
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(40.0),
  //           ),
  //           child: const PickLocation(),
  //         ),
  //       );
  //     },
  //     transitionBuilder: (context, animation, secondaryAnimation, child) {
  //       return ScaleTransition(
  //         scale: CurvedAnimation(
  //           parent: animation,
  //           curve: Curves.easeInOut,
  //         ),
  //         child: child,
  //       );
  //     },
  //   );
  // }

  _pickLocation(BuildContext context, TextEditingController controller,
      bool isSource) async {
    final selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PickLocation(),
      ),
    );

    if (selectedLocation != null) {
      LatLng position = selectedLocation['position'];
      final name = selectedLocation['name'];
      controller.text = name;
      if (isSource) {
        sourceCoordinates = [position.latitude, position.longitude];
      } else {
        destinationCoordinates = [position.latitude, position.longitude];
      }

      print(position);

      // You can also use the position if needed
    }
  }
}
