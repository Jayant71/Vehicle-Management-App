import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vehicle_management_app/core/config/theme/app_theme.dart';
import 'package:vehicle_management_app/firebase_options.dart';
import 'package:vehicle_management_app/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/time_cubit.dart';
import 'package:vehicle_management_app/presentation/pages/spashscreen/splashscreen.dart';
import 'package:vehicle_management_app/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(create: (context) => TimeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          Theme.of(context).brightness == Brightness.dark
              ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light)
              : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
          return MaterialApp(
            themeMode: ThemeMode.system,
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.darkTheme,
            home: Splashscreen(),
          );
        },
      ),
    );
  }
}
