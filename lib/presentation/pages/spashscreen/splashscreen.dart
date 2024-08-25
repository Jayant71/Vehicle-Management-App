import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vehicle_management_app/common/helpers/isLoggedin.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/ui/homepage.dart';
import 'package:vehicle_management_app/presentation/widgets/getstartedlogo.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  isUserLoggedIn() {
    return auth.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      bool isLoggedIn = isUserLoggedIn();
      if (context.mounted)
      // ignore: curly_braces_in_flow_control_structures
      if (isLoggedIn) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Homepage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const GetStartedPage()));
      }
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Getstartedlogo(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator.adaptive()),
          ],
        ),
      ),
    );
  }
}
