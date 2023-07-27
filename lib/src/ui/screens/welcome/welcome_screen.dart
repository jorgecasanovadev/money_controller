import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_controller/src/data/blocs/authentication/authentication_bloc.dart';
import 'package:money_controller/src/ui/components/buttons/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const routeName = '/';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //Bloc
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

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
                  const SizedBox(height: 15.0),
                  CustomPrimaryButton(
                    title: 'Home',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/home',
                      );
                    },
                    foregroundColor: white,
                    backgroundColor: blue500,
                    titleTextStyle: TypographyStyle.st165,
                  ),
                  const SizedBox(height: 15.0),
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
                    onPressed: () {
                      authenticationBloc.add(const OnInitAuthenticationEvent());
                      Navigator.pushNamed(
                        context,
                        '/sign_in_up',
                      );
                    },
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
