import 'package:flutter/material.dart';
import 'package:vehicle_management_app/core/config/assets/app_images.dart';
import 'package:vehicle_management_app/presentation/pages/auth/signinpage/signinpage.dart';
import 'package:vehicle_management_app/presentation/widgets/getstartedlogo.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppImages.getStarted,
                color: Colors.white,
              ),
            ),
          ),
          const Align(alignment: Alignment.center, child: Getstartedlogo()),
          const Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 190,
                ),
                Text(
                  'TRACK WISE',
                  style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Get Ready to Turn Heads, Ride Cool',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                icon: const Icon(Icons.arrow_forward),
                iconAlignment: IconAlignment.end,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SigninPage()));
                },
                label: const Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
