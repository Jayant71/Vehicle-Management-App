import 'package:flutter/material.dart';
import 'package:vehicle_management_app/presentation/pages/feedback/ui/feedbackpage.dart';

class RideCompletePage extends StatelessWidget {
  final String userId;
  final String rideId;

  const RideCompletePage(
      {required this.userId, required this.rideId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Complete'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FeedbackPage(userId: userId, rideId: rideId),
              ),
            );
          },
          child: const Text('Give Feedback'),
        ),
      ),
    );
  }
}
