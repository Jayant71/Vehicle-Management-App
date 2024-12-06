import 'package:flutter/material.dart';

extension ShowLoading on BuildContext {
  showLoading() {
    return showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
