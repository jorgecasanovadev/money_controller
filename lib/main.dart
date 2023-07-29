import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:money_controller/src/data/blocs/authentication/authentication_bloc.dart';
import 'package:money_controller/src/ui/screens/home/home_screen.dart';
import 'package:money_controller/src/ui/screens/welcome/welcome_screen.dart';
import 'package:money_controller/src/ui/screens/login/login_screen.dart';
import 'package:money_controller/src/ui/screens/login/sign_in_up_screen.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

import 'src/ui/screens/error/error_screen.dart';

void main() async {
  await dotenv.load(fileName: 'lib/.env');
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('es', ''),
          Locale('en', ''),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('es', ''),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: dotenv.get('DEBUG') == 'true',
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const WelcomeScreen());
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case '/sign_in_up':
            return MaterialPageRoute(builder: (_) => const SignInUpScreen());
          case '/home':
            return MaterialPageRoute(builder: (_) => const HomeScreen());

          default:
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return ErrorScreen(errorDetails: errorDetails);
            };
        }
        return null;
      },
    );
  }
}
