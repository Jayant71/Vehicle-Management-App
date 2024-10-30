import 'package:flutter/material.dart';

class ApplicationListPage extends StatefulWidget
    implements PreferredSizeWidget {
  const ApplicationListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ApplicationListPageState createState() => _ApplicationListPageState();

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}

class _ApplicationListPageState extends State<ApplicationListPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Column(
        children: [
          TabBar(
              controller: _tabController,
              tabs: const [Tab(text: 'Pending'), Tab(text: 'Approved')]),
        ],
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(55.0);
}
