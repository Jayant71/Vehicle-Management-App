import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/core/config/theme/app_theme.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signout.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
// import 'package:intl/intl.dart';
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
        drawer: _drawer(context),
        appBar: _appbar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _carousel(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  children: [
                    HomePageCard(
                      title: 'Refueling and Maintenance',
                      icon: const Icon(Icons.local_gas_station, size: 40),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RefuelingAndMaintenancePage(),
                          ),
                        );
                      },
                    ),
                    HomePageCard(
                      title: 'Vehicle List',
                      icon: const Icon(Icons.directions_car, size: 40),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VehicleListPage(),
                          ),
                        );
                      },
                    ),
                    HomePageCard(
                      title: 'Vehicle Request Form',
                      icon: const Icon(Icons.request_page, size: 40),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VehicleRequestForm(),
                          ),
                        );
                      },
                    ),
                    HomePageCard(
                      title: 'Vehicle Request Form',
                      icon: const Icon(Icons.request_page, size: 40),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VehicleRequestForm(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: FloatingActionButton.extended(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  label: const Text(
                    'Book a Vehicle',
                    style: TextStyle(fontSize: 20),
                  ),
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ));
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
        elevation: 5,
        title: BlocProvider(
            create: (context) => timeCubit, child: const TimerView()),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreenPage(),
                  ),
                );
              },
              icon: const Icon(Icons.person)),
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
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Admin Section'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              _signout(context);
            },
          ),
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
