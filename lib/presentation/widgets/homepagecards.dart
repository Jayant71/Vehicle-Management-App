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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            icon ?? const Icon(Icons.car_rental),
            const SizedBox(
              height: 5,
            ),
            Text(
              title ?? "Title",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
