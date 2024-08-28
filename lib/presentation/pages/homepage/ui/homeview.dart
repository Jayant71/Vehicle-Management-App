import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signout.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/timerview.dart';
import 'package:vehicle_management_app/presentation/pages/notifications/notificationpage.dart';
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
  late DraggableScrollableController _sheetController;

  @override
  void initState() {
    super.initState();
    _sheetController = DraggableScrollableController();
  }

  @override
  void dispose() {
    // _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    log("rebuilt");
    return Scaffold(
        drawer: _drawer(context),
        appBar: _appbar(),
        body: Stack(children: [
          GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              onCameraMove: (position) {
                // print(position);
              },
              onTap: (argument) {
                // print(argument);
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.7749, -122.4194),
                zoom: 15,
              )),
          // ListView(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   children: const [
          //     Center(
          //       child: Text(
          //         "Where do you want to go?",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: 25,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Center(
          //       child: Text(
          //         "Enter Source Location",
          //         style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     TextField(
          //       decoration: InputDecoration(
          //           hintText: "Enter your source",
          //           prefixIcon: Icon(Icons.search),
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(10)),
          //           )),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Center(
          //       child: Text(
          //         "Enter Destination Location",
          //         style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //     TextField(
          //       decoration: InputDecoration(
          //           hintText: "Enter your destination",
          //           prefixIcon: Icon(Icons.search),
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(10)),
          //           )),
          //     ),
          //   ],
          // ),
          Positioned.fill(
            child: DraggableScrollableSheet(
                initialChildSize: 0.5,
                minChildSize: 0,
                maxChildSize: 0.8,
                controller: _sheetController,
                snapSizes: const [0, 0.8],
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: const Column(
                        children: [
                          Divider(),
                          ListTile(
                            title: Text("Recent Trips"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Recent Trips"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Recent Trips"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Recent Trips"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]));
  }

  _appbar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 5,
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

  @override
  bool get wantKeepAlive => true;
}
