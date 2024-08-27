import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signout.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/timerview.dart';
import 'package:vehicle_management_app/presentation/pages/notifications/notificationpage.dart';
import 'package:vehicle_management_app/presentation/pages/refuelingandmaintenance/refuelingandmaintenancepage.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/profilescreenpage.dart';
import 'package:vehicle_management_app/presentation/pages/vehicle/vehiclelistpage/vehiclelistpage.dart';
import 'package:vehicle_management_app/presentation/pages/vehicle/vehiclerequestform/vehiclereq.dart';
import 'package:vehicle_management_app/presentation/widgets/homepagecards.dart';
import 'package:vehicle_management_app/service_locator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TimeCubit timeCubit = TimeCubit();
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: _drawer(context),
        appBar: _appbar(),
        body: Stack(children: [
          ListView(
            shrinkWrap: true,
            children: [
              _carousel(),
            ],
          ),
          // const Align(
          //   alignment: Alignment.center,
          //   child: GoogleMap(
          //       initialCameraPosition: CameraPosition(
          //     target: LatLng(0, 0),
          //     zoom: 15,
          //   )),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomSheet(
                enableDrag: false,
                backgroundColor: Theme.of(context).colorScheme.primary,
                onClosing: () {},
                builder: (ctx) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Center(
                          child: Text("Where do you want to go?",
                              style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("Source",
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.onPrimary,
                            filled: true,
                            enabled: false,
                            hintText: "Select source location",
                            hintStyle: const TextStyle(),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("Destination",
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.onPrimary,
                            filled: true,
                            enabled: false,
                            hintText: "Select destination location",
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                          ),
                          onPressed: () {},
                          child: Text("Book a Vehicle",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  );
                }),
          )
        ]));
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
    Future.delayed(const Duration(seconds: 1), () {
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
        timeCubit.stopTimer();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const GetStartedPage(),
          ),
        );
      }
    });
  }

  _appbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 5,
        title: BlocProvider(
            create: (context) => timeCubit, child: const TimerView()),
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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
    );
  }

  _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Name', style: TextStyle(fontSize: 30)),
          ),
          ListTile(
            leading:
                const Icon(Icons.wallet, color: Color.fromARGB(255, 0, 0, 0)),
            title: const Text(
              "Wallet",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.notification_add,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text(
              "Notification",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.description,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text(
              "Privacy Policies",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {},
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

  _carousel() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: CarouselView(
            itemSnapping: true,
            controller: carouselController,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemExtent: MediaQuery.of(context).size.width,
            children: [
              Container(
                height: 100,
                width: 200,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.green,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.yellow,
              ),
            ]),
      ),
    );
  }
}
