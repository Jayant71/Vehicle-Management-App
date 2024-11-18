import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

extension IsInternetConnected on BuildContext {
  isInternetConnected() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    return isConnected;
  }
}
