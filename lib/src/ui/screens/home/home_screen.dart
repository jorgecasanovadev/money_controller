import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'name',
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          const SafeArea(
            child: Center(
              child: Text('Data center'),
            ),
          ),
        ],
      ),
    );
  }
}
