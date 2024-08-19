import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_management_app/common/helpers/isLoggedin.dart';
import 'package:vehicle_management_app/presentation/pages/getstartedpage/getstartedpage.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/homepage.dart';
import 'package:vehicle_management_app/presentation/widgets/getstartedlogo.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  isUserLoggedIn() {
    return auth.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      bool isLoggedIn = isUserLoggedIn();

      // Navigate to respective pages
      if (isLoggedIn) {
        // User is logged in, navigate to home page
        Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return const Homepage();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, -1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        }));
      } else {
        // User is not logged in, navigate to login page
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
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
