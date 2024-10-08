import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  HomeCard({
    super.key,
    this.icon,
    this.title,
  });

  Icon? icon;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            icon ?? const Icon(Icons.car_rental),
            const SizedBox(
              height: 20,
            ),
            Text(
              title ?? "Title",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
