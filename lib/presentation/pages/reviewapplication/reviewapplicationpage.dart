import 'package:flutter/material.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';

class ReviewApplicationPage extends StatelessWidget {
  const ReviewApplicationPage({super.key, required this.application});

  final UserApplication application;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Review Application Page'),
      ),
    );
  }
}
