import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/screens/home/home_screen.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Controller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: bluegrey700,
          background: grey50,
          primary: primaryGreen,
          primaryContainer: grey70,
          secondary: mainSecondary,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
