import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart";

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String? uid;
  String? role_;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/homepage.webp"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ProfileCubit, dynamic>(
            builder: (context, state) {
              uid = state?.uid ?? "";
              role_ = state?.role ?? "user";
              return Text.rich(
                TextSpan(children: [
                  const TextSpan(
                    text: "Welcome\n",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
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
                textAlign: TextAlign.center,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withAlpha(230),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                context.go("/home/applicationform?uid=$uid&role=$role_");
              },
              child: const Text(
                "Book a Vehicle",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
