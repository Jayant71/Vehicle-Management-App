import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/time_cubit.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeCubit, String>(builder: (context, state) {
      return Text(
        state,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      );
    });
  }
}
