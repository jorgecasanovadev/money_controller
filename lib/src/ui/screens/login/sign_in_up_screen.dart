import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_controller/src/data/blocs/authentication/authentication_bloc.dart';
import 'package:money_controller/src/ui/components/buttons/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/components/views/logo_view.dart';
import 'package:money_controller/src/ui/screens/login/views/sign_in_section.dart';
import 'package:money_controller/src/ui/screens/login/views/sign_up_section.dart';

import '../../themes/themes.dart';

class SignInUpScreen extends StatefulWidget {
  const SignInUpScreen({super.key});
  static const routeName = '/sign_in_up';

  @override
  State<SignInUpScreen> createState() => _SignInUpScreenState();
}

class _SignInUpScreenState extends State<SignInUpScreen> {
  //Bloc
  late AuthenticationBloc authenticationBloc;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) => Scaffold(
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
                if (state.displayUIState == AuthenticationUIState.signIn)
                  SignInSection(
                    onSignIn: (String username, String password) {},
                    isLoading: state.isLoading,
                  ),
                if (state.displayUIState == AuthenticationUIState.signUp)
                  SignUpSection(
                    onSignUp: (String username, String password) {},
                    isLoading: state.isLoading,
                  ),
                const Spacer(),
                Text(
                  (state.displayUIState == AuthenticationUIState.signUp)
                      ? 'Do you have already an account?'
                      : "If you don't have an account yet?",
                  textAlign: TextAlign.center,
                  style: TypographyStyle.h7.white,
                ),
                const SizedBox(height: 20.0),
                CustomPrimaryButton(
                  title: (state.displayUIState == AuthenticationUIState.signUp)
                      ? 'Sign in'
                      : 'Sign up',
                  onPressed: () {
                    if (state.displayUIState == AuthenticationUIState.signUp) {
                      authenticationBloc.add(const OnInitAuthenticationEvent());
                      Navigator.pushReplacementNamed(
                        context,
                        '/sign_in_up',
                      );
                    }
                    if (state.displayUIState == AuthenticationUIState.signIn) {
                      authenticationBloc.add(const OnForceLogoutEvent());
                      Navigator.pushReplacementNamed(
                        context,
                        '/sign_in_up',
                      );
                    }
                  },
                  foregroundColor: white,
                  backgroundColor: grey100,
                  titleTextStyle: TypographyStyle.st165,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
