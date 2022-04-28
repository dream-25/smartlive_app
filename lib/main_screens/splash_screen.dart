import 'package:flutter/material.dart';

import '../utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await Navigator.pushReplacementNamed(context, MyRoutes.loginAllRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FittedBox(
            child: Image.asset('assets/images/splashscreen_image.png'),
            fit: BoxFit.cover));
  }
}
