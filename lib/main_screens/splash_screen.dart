import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
            child: Image.asset('assets/thunderbackground.jpg'),
            fit: BoxFit.cover));
  }
}
