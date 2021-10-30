import 'package:firebase_todo/screens/screens.dart';
import 'package:firebase_todo/utils/constants.dart';
import 'package:firebase_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'forgot_password_screen';

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Header(),
          const SizedBox(height: 10.0),
          Text(
            'Recovery password',
            style: kAppTitle,
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ReusableTextField(
              controller: _emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              hintText: "Please enter your email",
              prefixIcon: Icon(Icons.email, color: Colors.blue),
              errorText: null,
              suffixIcon: null,
            ),
          ),
          const SizedBox(height: 10.0),
          LinearButton(
            color1: Color(0xff1cb822),
            color2: Color(0xed69f55d),
            buttonTitle: "Send",
            onTap: () => print("send"),
          ),
          const SizedBox(height: 10.0),
          LinearButton(
            color1: Color(0xff2449e7),
            color2: Color(0xed438cfc),
            buttonTitle: "Back to Login",
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(SignInScreen.id, (route) => false),
          ),
        ],
      ),
    );
  }
}
