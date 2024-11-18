import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
    this.icon,
    this.title,
    this.onTap,
  });

  final Icon? icon;
  final String? title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: icon,
              )),
        ),
        Text(
          title ?? "Title",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
