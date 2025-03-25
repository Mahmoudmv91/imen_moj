import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:imen_moj/core/helper/global_providers.dart';
import 'package:imen_moj/core/helper/locator.dart';
import 'package:imen_moj/core/helper/theme_provider.dart';
import 'package:imen_moj/core/util/colors.dart';
import 'package:imen_moj/core/util/themes.dart';
import 'package:provider/provider.dart';

import 'config/firebase_option.dart';
import 'config/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'ImenMoj',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  await setup();
  runApp(providers());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    final themeProvider = context.read<ThemeProvider>();
    super.initState();
    _router = AppRouter().router;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      themeProvider.setSelectedThemeMode(ThemeMode.light);
    });
  }

  @override
  Widget build(BuildContext context) {
    _orientationMethod();
    _statusBarMethod();
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, __) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: AColors.background,
            systemNavigationBarIconBrightness: themeProvider.selectedThemeMode.index == 1 ? Brightness.dark : Brightness.light,
          ),
          child: MaterialApp.router(
            routerConfig: _router,
            locale: const Locale('fa', 'IR'),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const[
              Locale('en'),
              Locale('fa'),
            ],
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: themeProvider.selectedThemeMode,
            themeAnimationStyle: AnimationStyle(
              curve: Curves.easeIn,
            ),
            debugShowCheckedModeBanner: false,
            title: 'ایمن موج',
          ),
        );
      },
    );
  }

  void _orientationMethod() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _statusBarMethod() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }
}
