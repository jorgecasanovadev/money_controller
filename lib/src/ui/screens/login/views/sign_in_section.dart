import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/components/buttons/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/components/custom_form_fields/custom_password_field.dart';
import 'package:money_controller/src/ui/components/custom_form_fields/custom_text_field.dart';

import '../../../themes/themes.dart';

class SignInSection extends StatefulWidget {
  const SignInSection({
    required this.onSignIn,
    required this.isLoading,
    Key? key,
  }) : super(key: key);
  final bool isLoading;
  final void Function(String username, String password) onSignIn;

  @override
  SignInSectionState createState() => SignInSectionState();
}

class SignInSectionState extends State<SignInSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textUsernameController = TextEditingController();
  final TextEditingController _textPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _isRemember = false;

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
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _isRemember = !_isRemember;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isRemember
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        size: 25.0,
                        color: grey100,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        "Remember me",
                        textAlign: TextAlign.center,
                        style: TypographyStyle.h7.grey100,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password",
                    textAlign: TextAlign.center,
                    style: TypographyStyle.h7.grey100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            // Sign-in Button
            CustomPrimaryButton(
              title: "Sign in!",
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
