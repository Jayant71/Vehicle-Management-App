import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/create_vehicle_usecase.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';
import 'package:vehicle_management_app/service_locator.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController vehicleManufacturerController = TextEditingController();
  TextEditingController vehicleBrandController = TextEditingController();
  TextEditingController vehicleStatusController = TextEditingController();
  TextEditingController vehicleFuelTypeController = TextEditingController();
  TextEditingController vehicleYearController = TextEditingController();
  TextEditingController vehicleOwnerController = TextEditingController();
  TextEditingController vehicleUserController = TextEditingController();
  TextEditingController vehicleRemarkController = TextEditingController();
  TextEditingController vehicleDriverController = TextEditingController();
  TextEditingController vehicleImageUrlController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(title: "Add Vehicle"),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
            shrinkWrap: true,
            children: [
              buildInfoField(
                  "Vehicle Number",
                  "Enter Vehicle Number",
                  vehicleNumberController,
                  TextInputType.text, validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a valid vehicle number";
                }
                return null;
              }),

              buildInfoField(
                  "Vehicle Type",
                  "Enter Vehicle Type",
                  vehicleTypeController,
                  TextInputType.text, validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a valid vehicle type";
                }
                return null;
              }),
              buildInfoField(
                "Manufacturer",
                "Enter Manufacturer",
                vehicleManufacturerController,
                TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid manufacturer";
                  }
                  return null;
                },
              ),
              buildInfoField("Brand", "Enter Brand", vehicleBrandController,
                  TextInputType.text),
              buildInfoField("Status", "Enter Status", vehicleStatusController,
                  TextInputType.text),
              buildInfoField(
                  "Fuel Type",
                  "Enter Fuel Type",
                  vehicleFuelTypeController,
                  TextInputType.text, validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a valid fuel type";
                }
                return null;
              }),
              buildInfoField("Year", "Enter Year", vehicleYearController,
                  TextInputType.number),
              buildInfoField("Owner", "Enter Owner", vehicleOwnerController,
                  TextInputType.text),
              buildInfoField("User", "Enter User", vehicleUserController,
                  TextInputType.text),
              buildInfoField("Remark", "Enter Remark", vehicleRemarkController,
                  TextInputType.text),
              // buildInfoField("Driver", "Enter Driver", vehicleDriverController,
              //     TextInputType.text),
              buildInfoField("Image URL", "Enter Image URL",
                  vehicleImageUrlController, TextInputType.text),
              ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    sl<CreateVehicleUsecase>().call(
                      params: VehicleModel(
                        vehicleId: const Uuid().v4(),
                        registrationNumber: vehicleNumberController.text,
                        type: vehicleTypeController.text,
                        brand: vehicleBrandController.text,
                        fuelType: vehicleFuelTypeController.text,
                        imageUrl: vehicleImageUrlController.text,
                        manufacturer: vehicleManufacturerController.text,
                        remark: vehicleRemarkController.text,
                        status: vehicleStatusController.text,
                        year: int.parse(vehicleYearController.text),
                        // driverId: vehicleDriverController.text,
                      ),
                    );
                  },
                  child: const Text("Add Vehicle"))
            ],
          ),
        ));
  }

  buildInfoField(String label, String hint, TextEditingController controller,
      TextInputType inputType,
      {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
