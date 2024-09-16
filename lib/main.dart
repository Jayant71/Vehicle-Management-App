import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vehicle_management_app/core/config/theme/app_theme.dart';
import 'package:vehicle_management_app/core/config/theme/text_theme.dart';
import 'package:vehicle_management_app/firebase_options.dart';
import 'package:vehicle_management_app/presentation/cubit/theme_cubit/theme_cubit.dart';
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

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setSystemUIOverlayStyle(ThemeMode.system);
  }

  void _setSystemUIOverlayStyle(ThemeMode themeMode) {
    final brightness = themeMode == ThemeMode.dark
        ? Brightness.dark
        : themeMode == ThemeMode.light
            ? Brightness.light
            : PlatformDispatcher.instance.platformBrightness;

    SystemUiOverlayStyle style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto Flex", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          _setSystemUIOverlayStyle(themeMode);

          return MaterialApp(
            themeMode: themeMode,
            theme: theme.light(),
            darkTheme: theme.dark(),
            debugShowCheckedModeBanner: false,
            home: Splashscreen(),
            // home: Spl,
          );
        },
      ),
    );
  }
}
