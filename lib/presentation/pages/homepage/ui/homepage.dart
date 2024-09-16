import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/navindex_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/homeview.dart';
import 'package:vehicle_management_app/presentation/pages/reviewapplication/applicationlistpage.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/profilescreenpage.dart';
import 'package:vehicle_management_app/presentation/pages/vehicle/vehiclelistpage/vehiclelistpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController pageController = PageController();
  int _currentIndx = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavindexCubit>(
          create: (context) => NavindexCubit(),
        ),
        BlocProvider<TimeCubit>(create: (context) => TimeCubit()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SafeArea(
          child: BlocBuilder<NavindexCubit, dynamic>(
            builder: (context, state) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: state,
                onTap: (value) {
                  context.read<NavindexCubit>().changeIndex(value);
                  setState(() {
                    _currentIndx = value;
                  });
                  // pageController.animateToPage(
                  //   value,
                  //   duration: const Duration(milliseconds: 100),
                  //   curve: Curves.linear,
                  // );
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.car_rental),
                    label: 'Vehicles',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.pages),
                    label: 'Applications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Person',
                  ),
                ],
              );
            },
          ),
        ),
        body: IndexedStack(
          // controller: pageController,
          // physics: const NeverScrollableScrollPhysics(),
          index: _currentIndx,
          children: const [
            HomeView(),
            VehicleListPage(),
            ApplicationListPage(),
            ProfileScreenPage()
          ],
        ),
      ),
    );
  }
}
