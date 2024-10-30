import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signout.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/cubit/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/timerview.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/profilescreenpage.dart';
import 'package:vehicle_management_app/presentation/pages/vehicle/vehiclelistpage/vehiclelistpage.dart';
import 'package:vehicle_management_app/presentation/pages/vehicle/vehiclerequestform/vehiclereq.dart';
import 'package:vehicle_management_app/service_locator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  TimeCubit timeCubit = TimeCubit();
  CarouselController carouselController = CarouselController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  String? uid;

  @override
  initState() {
    super.initState();
    context.read<ProfileCubit>().getUserProfile();
  }

  @override
  void dispose() {
    timeCubit.stopTimer();
    ProfileCubit().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    log("rebuilt");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: _drawer(context),
        appBar: _appbar(),
        body: ListView(
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
        ));
  }

  _appbar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 5,
      centerTitle: true,
      title: const TimerView(),
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.notifications,
      //         color: Theme.of(context).colorScheme.onPrimary),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const NotificationPage(),
      //         ),
      //       );
      //     },
      //   ),
      //   const SizedBox(
      //     width: 10,
      //   ),
      // ],
    );
  }

  _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: BlocBuilder<ProfileCubit, UserModel?>(
                builder: (context, state) {
              return ListView(
                shrinkWrap: true,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150?text=${state?.fullName}'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      state?.fullName ?? "User",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreenPage(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.description,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text(
              "Vehicle List",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VehicleListPage(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.album_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text(
              "Contact Us",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.feedback,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text(
              "Feedback",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const FeedbackPage(),
              //   ),
              // );
            },
          ),
          const Divider(),
          ListTile(
            leading:
                const Icon(Icons.settings, color: Color.fromARGB(255, 0, 0, 0)),
            title: const Text(
              "Settings",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text(
              "Sign Out",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              _signout(context);
            },
          )
        ],
      ),
    );
  }

  _signout(BuildContext context) async {
    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    var result = await sl<SignoutUseCase>().call();
    Future.delayed(const Duration(seconds: 2), () {
      timeCubit.stopTimer();
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(result.fold(
            (l) => l.toString(),
            (r) => r.toString(),
          )),
        ));
        log(result.toString());
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const GetStartedPage(),
          ),
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  _pickLocation() async {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Pick Location"),
            content: SizedBox(
              height: 400,
              width: 400,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 10,
                ),
                onMapCreated: (GoogleMapController controller) {},
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("Close"),
              ),
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
