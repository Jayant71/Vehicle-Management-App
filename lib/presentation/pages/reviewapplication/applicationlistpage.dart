import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/presentation/pages/reviewapplication/cubit/applicationlist_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart';

class ApplicationListPage extends StatefulWidget
    implements PreferredSizeWidget {
  const ApplicationListPage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ApplicationListPageState createState() => _ApplicationListPageState();

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}

class _ApplicationListPageState extends State<ApplicationListPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  List approvedApplications = [];
  List selfApplications = [];
  List selfApprovedApplications = [];
  bool self = false;
  late dynamic profileCubit;

  fetchApplications() {
    if (profileCubit is UserModel) {
      final cubit = context.read<ApplicationlistCubit>();
      if (profileCubit.role == 'user') {
        cubit.getApplications(true, '', '', '');
      } else if (profileCubit.role == "allocator") {
        cubit.getApplications(self, 'allocator', '2', '');
      } else if (profileCubit.role == "hod") {
        cubit.getApplications(self, 'hod', '3', profileCubit.department);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    profileCubit = context.read<ProfileCubit>().state;
    fetchApplications();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('Applications',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          automaticallyImplyLeading: false,
          actions: [
            if (profileCubit.role != 'user')
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Self',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary)),
                  Switch(
                      activeColor: Colors.amberAccent,
                      value: self,
                      onChanged: (val) {
                        setState(() {
                          self = val;
                          fetchApplications();
                        });
                      }),
                ],
              )
          ],
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [Tab(text: 'Pending'), Tab(text: 'Approved')],
            onTap: (value) => setState(() {}),
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              BlocBuilder<ApplicationlistCubit, ApplicationlistState>(
                  builder: (context, state) {
                if (state is ApplicationlistLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ApplicationlistLoaded) {
                  approvedApplications = state.applications
                      .where((application) => application.accepted == "true")
                      .toList();

                  if (self && profileCubit.role == 'admin') {
                    selfApplications = state.applications
                        .where((application) =>
                            application.userId == profileCubit.uid)
                        .toList();
                    selfApprovedApplications = selfApplications
                        .where((application) => application.accepted == "true")
                        .toList();

                    return ListView.builder(
                      itemCount: selfApplications.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final application = selfApplications[index];
                        return ListTile(
                          title: Text(application.purpose),
                          subtitle: Text(application.vehicleId),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            context.go('/home/reviewapplication',
                                extra: application);
                          },
                        );
                      },
                    );
                  }

                  return ListView.builder(
                    itemCount: state.applications.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final application = state.applications[index];
                      return ListTile(
                        title: Text(application.purpose),
                        subtitle: Text(application.vehicleId),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          context.go('/home/reviewapplication',
                              extra: application);
                        },
                      );
                    },
                  );
                } else if (state is ApplicationlistError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              }),
              if (!self && profileCubit.role == 'user')
                ListView.builder(
                  itemCount: approvedApplications.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final application = approvedApplications[index];
                    return ListTile(
                      title: Text(application.purpose),
                      subtitle: Text(application.vehicleId),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    );
                  },
                ),
              if (!self && profileCubit.role != 'user')
                ListView.builder(
                  itemCount: selfApprovedApplications.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final application = selfApprovedApplications[index];
                    return ListTile(
                      title: Text(application.purpose),
                      subtitle: Text(application.vehicleId),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        context.go('/home/reviewapplication',
                            extra: application);
                      },
                    );
                  },
                ),
              if (self && profileCubit.role != 'user')
                ListView.builder(
                  itemCount: selfApprovedApplications.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final application = selfApprovedApplications[index];
                    return ListTile(
                      title: Text(application.purpose),
                      subtitle: Text(application.vehicleId),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        context.go('/home/reviewapplication',
                            extra: application);
                      },
                    );
                  },
                ),
            ],
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
