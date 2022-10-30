import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/homr.dart';
import 'package:pacienteneuro/src/pages/login.dart';
import 'package:pacienteneuro/src/pages/questionario.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }

  Widget _introScreen() {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: const Color.fromRGBO(88, 129, 87, 1),
          navigateAfterSeconds: const LoginPage(),
          loaderColor: Colors.transparent,
        ),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/logo.png")),
        ),
      ],
    );
  }
}
