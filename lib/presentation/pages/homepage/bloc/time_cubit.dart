import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TimeCubit extends HydratedCubit<String> {
  TimeCubit() : super(_getCurrentTime()) {
    _startTimer();
  }

  static String _getCurrentTime() {
    final now = DateTime.now();
    // Formatting the time as 'HH:mm' and the day of the week as 'EEEE'
    String formattedDateTime = DateFormat('HH:mm').format(now);
    String dayOfWeek = DateFormat('EEEE').format(now);
    formattedDateTime = '$dayOfWeek  $formattedDateTime';
    return formattedDateTime;
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(_getCurrentTime());
    });
  }

  @override
  String fromJson(Map<String, dynamic> json) {
    return json['time'] as String;
  }

  @override
  Map<String, dynamic> toJson(String state) {
    return {'time': state};
  }
}
