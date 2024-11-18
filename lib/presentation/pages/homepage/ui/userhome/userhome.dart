import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:vehicle_management_app/data/models/user/user.dart";
import "package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart";
import "package:vehicle_management_app/presentation/pages/vehicle/vehiclerequestform/vehiclereq.dart";

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String? uid;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: BlocBuilder<ProfileCubit, UserModel?>(
              builder: (context, state) {
                uid = state?.uid ?? "";
                return Text.rich(
                  TextSpan(children: [
                    const TextSpan(
                      text: "Welcome,\n",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: state?.fullName ?? "User",
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                );
              },
            )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicleRequestForm(
                    uid: uid!,
                  ),
                ),
              );
            },
            child: const Text(
              "Book a Vehicle",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
