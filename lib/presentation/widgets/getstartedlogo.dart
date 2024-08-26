import 'package:flutter/material.dart';
import 'package:vehicle_management_app/core/config/assets/app_images.dart';

class Getstartedlogo extends StatelessWidget {
  const Getstartedlogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 130,
        height: 130,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ClipOval(
          child: Image.asset(
            AppImages.logo,
          ),
        ),
      ),
    ]);
  }
}
