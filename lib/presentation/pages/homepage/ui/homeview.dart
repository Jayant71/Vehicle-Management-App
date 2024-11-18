import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signout.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/cubit/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/timerview.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/userhome/adminhome.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/userhome/driverhome.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/userhome/userhome.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/profilescreenpage.dart';
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
  String? role;

  // @override
  // initState() {
  //   super.initState();
  //   context.read<ProfileCubit>().getUserProfile();
  // }

  @override
  void dispose() {
    timeCubit.stopTimer();
    ProfileCubit().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    role = context.read<ProfileCubit>().state?.role.toString();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: _drawer(context),
        appBar: _appbar(),
        body: role == 'driver'
            ? const DriverHome()
            : role == 'admin'
                ? const AdminHome()
                : const UserHome());
  }

  _appbar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 5,
      centerTitle: true,
      // title: const TimerView(),
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const VehicleListPage(),
              //   ),
              // );
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
        Navigator.of(context).popUntil((route) => route.isFirst);
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
