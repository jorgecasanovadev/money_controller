import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_controller/src/ui/components/buttons/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/components/views/logo_view.dart';

import '../../themes/themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
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
              const LogoView(),
              const Spacer(),
              const SizedBox(height: 15.0),
              CustomPrimaryButton(
                hasIconButton: true,
                iconButton: const Icon(Icons.apple_outlined, size: 30.0),
                title: 'Sign up with Apple',
                onPressed: () {},
                foregroundColor: white,
                backgroundColor: black.withOpacity(0.6),
                titleTextStyle: TypographyStyle.st165,
              ),
              const SizedBox(height: 15.0),
              CustomPrimaryButton(
                hasIconButton: true,
                iconButton: const Icon(FontAwesomeIcons.google, size: 25.0),
                title: 'Sign up with Google',
                onPressed: () {},
                foregroundColor: black50,
                backgroundColor: white,
                titleTextStyle: TypographyStyle.st165,
              ),
              const SizedBox(height: 15.0),
              CustomPrimaryButton(
                hasIconButton: true,
                iconButton: const Icon(Icons.facebook_outlined, size: 30.0),
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
                onPressed: () => Navigator.pushNamed(context, '/sign_in_up'),
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
