import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/components/buttons/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/components/custom_form_fields/custom_password_field.dart';
import 'package:money_controller/src/ui/components/custom_form_fields/custom_text_field.dart';
import 'package:money_controller/src/ui/components/custom_form_fields/static_separator_line.dart';

import '../../../themes/themes.dart';

class SignUpSection extends StatefulWidget {
  const SignUpSection({
    required this.onSignUp,
    required this.isLoading,
    Key? key,
  }) : super(key: key);
  final bool isLoading;
  final void Function(String username, String password) onSignUp;

  @override
  SignUpSectionState createState() => SignUpSectionState();
}

class SignUpSectionState extends State<SignUpSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textUsernameController = TextEditingController();
  final TextEditingController _textPasswordController = TextEditingController();

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textUsernameController.dispose();
    _textPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // TextFormField Username
            Semantics(
              label: 'Username',
              textField: true,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CustomTextField(
                  title: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  controller: _textUsernameController,
                ),
              ),
            ),
            // TextFormField Password
            Semantics(
              label: 'Password',
              textField: true,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CustomPasswordField(
                  title: 'Password',
                  keyboardType: TextInputType.text,
                  controller: _textPasswordController,
                  onShowPassword: () {
                    _obscureText = !_obscureText;
                    setState(() {});
                  },
                  obscureText: _obscureText,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const StaticSeparatorLine(separatorCounter: 4),
            const SizedBox(height: 10.0),
            Text(
              "Use 8 or more characters with a mix \nof letters, numbers & symbols.",
              textAlign: TextAlign.center,
              style: TypographyStyle.h7.grey100,
            ),
            const SizedBox(height: 15.0),
            // Sign-up Button
            CustomPrimaryButton(
              title: "Get started it's free!",
              onPressed: () {},
              foregroundColor: white,
              backgroundColor: green500,
              titleTextStyle: TypographyStyle.st165,
            ),
          ],
        ),
      ),
    );
  }
}
