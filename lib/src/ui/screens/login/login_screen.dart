import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/components/custom_primary_button.dart.dart';

import '../../themes/themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: grey200.withOpacity(0.5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logos/money-logo.png',
                    width: media.width * 0.2,
                    fit: BoxFit.contain,
                    color: Colors.white.withOpacity(0.8),
                    colorBlendMode: BlendMode.modulate,
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'Money Controller',
                      textAlign: TextAlign.center,
                      style: TypographyStyle.h3.w900.white.copyWith(
                        fontFamily: 'Houston',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomPrimaryButton(
                title: 'Sign up with Facebook',
                onPressed: () {},
                foregroundColor: white,
                backgroundColor: blueFacebook.withOpacity(0.6),
                titleTextStyle: TypographyStyle.st165,
              ),
              const SizedBox(height: 25.0),
              Text(
                'or',
                textAlign: TextAlign.center,
                style: TypographyStyle.h7.white,
              ),
              const SizedBox(height: 25.0),
              CustomPrimaryButton(
                title: 'Sign up with e-mail',
                onPressed: () {},
                foregroundColor: white,
                backgroundColor: grey100,
                titleTextStyle: TypographyStyle.st165,
              ),
              const SizedBox(height: 20.0),
              Text(
                'By registering, you agree to our Terms and Conditions of Use. Learn how we collect, use and share your data.',
                textAlign: TextAlign.center,
                style: TypographyStyle.h7.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
