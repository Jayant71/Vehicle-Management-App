import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/presentation/cubit/currentlocation/currentlocation_cubit.dart';
import 'package:vehicle_management_app/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/user/profilescreen/cubit/profile_cubit.dart';

class BlocProviders {
  static List<BlocProvider> get providers => [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<CurrentlocationCubit>(
            create: (_) => CurrentlocationCubit()),
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
      ];
}
