import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/core/config/theme/app_colors.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signout.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
// import 'package:intl/intl.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/timerview.dart';
import 'package:vehicle_management_app/presentation/pages/vehiclerequestform/vehiclereq.dart';
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
      backgroundColor: AppColors.grey,
      extendBodyBehindAppBar: true,
      drawer: _drawer(context),
      appBar: _appbar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _carousel(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.lightbackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                ),
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                children: [
                  HomeCard(
                    icon: const Icon(Icons.car_repair, size: 50),
                    title: "Maintenance & Refueling",
                  ),
                  HomeCard(
                    icon: const Icon(Icons.car_rental, size: 50),
                    title: "Vehicle List",
                  ),
                  HomeCard(
                    icon: const Icon(Icons.car_rental, size: 50),
                    title: "",
                  ),
                  HomeCard(
                    icon: const Icon(Icons.feedback, size: 50),
                    title: "Feedback",
                  ),
                ],
              ).animate().fadeIn(duration: 300.ms).scale(delay: 300.ms),
            )
                .animate()
                .slideY(duration: 300.ms, delay: 300.ms, begin: 1, end: 0),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FloatingActionButton.extended(
                    extendedPadding: const EdgeInsets.symmetric(
                      horizontal: 70,
                    ),
                    backgroundColor: Colors.blue,
                    label: const Text(
                      'Book Vehicle',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VehicleRequestForm(),
                        ),
                      );
                    }),
              ),
            ),
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

  _appbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
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
            onPressed: () {},
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
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
    return Padding(
      padding: const EdgeInsets.only(top: 140),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
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
