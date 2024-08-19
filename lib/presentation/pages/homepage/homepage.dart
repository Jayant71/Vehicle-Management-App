import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_management_app/core/config/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_management_app/presentation/pages/appllications/applications.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/vehiclerequestform/vehiclereq.dart';
import 'package:vehicle_management_app/presentation/widgets/homepagecards.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // String getCurrentDateTime() {
  //   DateTime now = DateTime.now();
  //   String formattedDateTime = DateFormat('HH:mm').format(now);
  //   String dayOfWeek = DateFormat('EEEE').format(now);
  //   formattedDateTime = '$dayOfWeek  $formattedDateTime';
  //   return formattedDateTime.toString();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightpurple,
      extendBodyBehindAppBar: true,
      drawer: Drawer(
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
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: BlocBuilder<TimeCubit, String>(
            builder: (context, state) {
              return Text(state);
            },
          ),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: AppColors.darktext,
        currentIndex: 0,
        iconSize: 30,
        onTap: (value) {
          switch (value) {
            // case 0:
            //   Navigator.pushNamed(context, '/homepage');
            //   break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const VehicleRequestForm(),
              ));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Applications(),
              ));
              break;
          }
        },
        backgroundColor: AppColors.lightpurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.document_scanner,
            ),
            label: 'History',
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary,
                    AppColors.lightpurple,
                  ],
                ),
              ),
              padding: const EdgeInsets.only(top: 50),
              child: Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      'assets/animations/homepage_animation.json',
                      renderCache: RenderCache.raster),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 90),
                    child: Text(
                      'Welcome to Vehicle Management',
                      style: TextStyle(
                        color: AppColors.lightbackground,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 70, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Book a Vehicle'),
                    ),
                  ),
                )
              ]),
            ),
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
              height: MediaQuery.of(context).size.height * 0.4,
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
        ],
      ),
    );
  }
}
