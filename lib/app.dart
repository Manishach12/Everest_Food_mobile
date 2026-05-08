import 'package:everest_food_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everest Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Poppins', // Make sure to add this to pubspec.yaml
      ),
      home: const SplashView(), // Start with Splash
    );
  }
}
