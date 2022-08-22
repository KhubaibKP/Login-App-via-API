import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ms_task1/homepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('images/Loremipsum.jpg'),
        ],
      ),
      backgroundColor: Colors.white,
      nextScreen: MyHomePage(),
      splashTransition: SplashTransition.slideTransition,
      splashIconSize: 350,
      duration: 4000,
      animationDuration: const Duration(seconds: 1),

    );
  }


}


