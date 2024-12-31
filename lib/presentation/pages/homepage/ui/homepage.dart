import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/cubit/navindex_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/cubit/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/homeview.dart';
import 'package:vehicle_management_app/presentation/pages/applicationlist/applicationlistpage.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController pageController = PageController(initialPage: 0);

  String? role_;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    role_ = context.read<ProfileCubit>().state?.role;

    return MultiBlocProvider(
        providers: [
          BlocProvider<NavindexCubit>(
            create: (context) => NavindexCubit(),
          ),
          BlocProvider<TimeCubit>(create: (context) => TimeCubit()),
        ],
        child: Scaffold(
          bottomNavigationBar: (role_ != 'admin' && role_ != 'driver')
              ? SafeArea(
                  child: BlocBuilder<NavindexCubit, dynamic>(
                    builder: (context, state) {
                      return BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.white.withAlpha(150),
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        selectedItemColor: Colors.black,
                        selectedIconTheme: const IconThemeData(size: 35),
                        selectedLabelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        elevation: 0,
                        selectedFontSize: 17,
                        unselectedFontSize: 15,
                        currentIndex: state,
                        onTap: (value) {
                          context.read<NavindexCubit>().changeIndex(value);
                          setState(() {
                            pageController.animateToPage(value,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          });
                        },
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.pages),
                            label: 'Applications',
                          ),
                        ],
                      );
                    },
                  ),
                )
              : null,
          body: (role_ != 'admin' && role_ != 'driver')
              ? PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                      HomeView(role: role_!),
                      const ApplicationListPage(),
                    ])
              : HomeView(role: role_!),
        ));
  }
}
