import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smartlive/main_screens/home_page.dart';
import 'package:smartlive/main_screens/splash_screen.dart';
import 'package:smartlive/main_screens/user_login_all.dart';
import 'package:smartlive/main_screens/user_new_register.dart';
import 'package:smartlive/utils/routes.dart';
import 'firebase_options.dart';
import 'main_screens/user_login_phone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: const [
          Locale("af"),
          Locale("am"),
          Locale("ar"),
          Locale("az"),
          Locale("be"),
          Locale("bg"),
          Locale("bn"),
          Locale("bs"),
          Locale("ca"),
          Locale("cs"),
          Locale("da"),
          Locale("de"),
          Locale("el"),
          Locale("en"),
          Locale("es"),
          Locale("et"),
          Locale("fa"),
          Locale("fi"),
          Locale("fr"),
          Locale("gl"),
          Locale("ha"),
          Locale("he"),
          Locale("hi"),
          Locale("hr"),
          Locale("hu"),
          Locale("hy"),
          Locale("id"),
          Locale("is"),
          Locale("it"),
          Locale("ja"),
          Locale("ka"),
          Locale("kk"),
          Locale("km"),
          Locale("ko"),
          Locale("ku"),
          Locale("ky"),
          Locale("lt"),
          Locale("lv"),
          Locale("mk"),
          Locale("ml"),
          Locale("mn"),
          Locale("ms"),
          Locale("nb"),
          Locale("nl"),
          Locale("nn"),
          Locale("no"),
          Locale("pl"),
          Locale("ps"),
          Locale("pt"),
          Locale("ro"),
          Locale("ru"),
          Locale("sd"),
          Locale("sk"),
          Locale("sl"),
          Locale("so"),
          Locale("sq"),
          Locale("sr"),
          Locale("sv"),
          Locale("ta"),
          Locale("tg"),
          Locale("th"),
          Locale("tk"),
          Locale("tr"),
          Locale("tt"),
          Locale("uk"),
          Locale("ug"),
          Locale("ur"),
          Locale("uz"),
          Locale("vi"),
          Locale("zh")
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'SmartLive',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        initialRoute: '/',
        themeMode: ThemeMode.light,
        routes: {
          '/': (context) => const SplashPage(),
          MyRoutes.rootRoute: (context) => const SplashPage(),
          MyRoutes.splashRoute: (context) => const SplashPage(),
          MyRoutes.loginNumberRoute: (context) => const UserLoginPhone(),
          MyRoutes.userHomeRootRoute: (context) => HomeRootPage(pageIndex: 0),
          MyRoutes.loginAllRoute: (context) => const UserLoginAll(),
          MyRoutes.userRegisterNewRoute: (context) =>
              UserNewRegister("0", "0", "0"),
        });
  }
}
