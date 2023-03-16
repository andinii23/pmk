import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapi_pmk/pages/home.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage({Key? key}) : super(key: key);

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Home(),
      imageBackground: Image.asset("img/splash.jpg").image,
      useLoader: true,
      loaderColor: Colors.black,
      loadingText: Text(
        "loading..",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
