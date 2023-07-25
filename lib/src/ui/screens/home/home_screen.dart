import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_controller/src/ui/components/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/imgs/social-money.jpg',
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
            color: Colors.white.withOpacity(0.8),
            colorBlendMode: BlendMode.modulate,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    'asdfsadfasdfsadfadsfasdf asdfsadfasdfsadfadsfasdf asdfsadfasdfsadfadsfasdf',
                    textAlign: TextAlign.center,
                    style: TypographyStyle.h6,
                  ),
                  const SizedBox(height: 30.0),
                  CustomPrimaryButton(
                    title: 'Get started',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/login',
                    ),
                    foregroundColor: white,
                    backgroundColor: green500,
                    titleTextStyle: TypographyStyle.st165,
                  ),
                  const SizedBox(height: 15.0),
                  CustomPrimaryButton(
                    title: 'I have an account',
                    onPressed: () {},
                    foregroundColor: white,
                    backgroundColor: grey100,
                    titleTextStyle: TypographyStyle.st165,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
