import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_management_app/presentation/pages/reviewapplication/cubit/applicationlist_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late dynamic profileCubit;
  bool pending = true;
  List completedTask = [];

  fetchApplications() {
    final cubit = context.read<ApplicationlistCubit>();
    cubit.getApplications(false, 'driver', '', '');
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    profileCubit = context.read<ProfileCubit>().state;
    fetchApplications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text("Pending Task"),
            ),
            Tab(
              child: Text("Completed Task"),
            ),
          ],
          onTap: (value) {
            if (value == 1) {
              pending = true;
            } else {
              setState(() {
                pending = false;
                fetchApplications();
              });
            }
          },
        ),
      ),
      body: IndexedStack(
        index: _tabController.index,
        children: [
          BlocBuilder<ApplicationlistCubit, ApplicationlistState>(
              builder: (context, state) {
            if (state is ApplicationlistLoaded) {
              completedTask = state.applications
                  .where((application) => application.status == '0')
                  .toList();
              return ListView.builder(
                itemCount: state.applications.length,
                itemBuilder: (context, index) {
                  final application = state.applications[index];
                  return ListTile(
                    title: Text(application.sourceName),
                    subtitle: Text(application.destinationName),
                    onTap: () {
                      context.go('/home/reviewapplication', extra: application);
                    },
                  );
                },
              );
            } else if (state is ApplicationlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ApplicationlistError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          }),
          ListView.builder(
            itemCount: completedTask.length,
            itemBuilder: (context, index) {
              final application = completedTask[index];
              return ListTile(
                title: Text(application.sourceName),
                subtitle: Text(application.destinationName),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchApplications();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(55.0);
}
