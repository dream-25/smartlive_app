import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartlive/main_screens/splash_screen.dart';
import 'package:smartlive/utils/routes.dart';

import 'main_screens/user_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Liquid Exchange',
        theme: ThemeData(primarySwatch: Colors.red),
        initialRoute: '/',
        themeMode: ThemeMode.light,
        routes: {
          '/': (context) => const SplashPage(),
          MyRoutes.rootRoute: (context) => const SplashPage(),
          MyRoutes.splashRoute: (context) => const SplashPage(),
          MyRoutes.loginNumberRoute: (context) => const UserLogin(),
        });
  }
}
