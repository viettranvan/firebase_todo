import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_todo/screens/screens.dart';
import 'package:firebase_todo/utils/utils.dart';
import 'package:firebase_todo/widgets/header.dart';
import 'package:firebase_todo/widgets/linear_button.dart';
import 'package:firebase_todo/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'sign_up_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController =
      TextEditingController();
  bool isObscureTextPass = true;
  bool isObscureTextRePass = true;

  @override
  Widget build(BuildContext context) {
    Widget _togglePass = GestureDetector(
      onTap: () {
        setState(() {
          isObscureTextPass = !isObscureTextPass;
        });
      },
      child: isObscureTextPass
          ? Icon(Icons.visibility, color: Colors.black54)
          : Icon(Icons.visibility_off, color: Colors.black54),
    );
    Widget _toggleRePass = GestureDetector(
      onTap: () {
        setState(() {
          isObscureTextRePass = !isObscureTextRePass;
        });
      },
      child: isObscureTextRePass
          ? Icon(Icons.visibility, color: Colors.black54)
          : Icon(Icons.visibility_off, color: Colors.black54),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Header(),
                const SizedBox(height: 10.0),
                Text("Register an account", style: kAppTitle),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ReusableTextField(
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: "Please enter your email",
                    prefixIcon: Icon(Icons.email, color: Colors.blue),
                    suffixIcon: null,
                    errorText: null,
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ReusableTextField(
                    controller: _passwordController,
                    obscureText: isObscureTextPass,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "Please enter your password",
                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                    suffixIcon: _togglePass,
                    errorText: null,
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ReusableTextField(
                    controller: _reEnterPasswordController,
                    obscureText: isObscureTextRePass,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hintText: "Re-Enter your password",
                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                    suffixIcon: _toggleRePass,
                    errorText: null,
                  ),
                ),
                const SizedBox(height: 10.0),
                LinearButton(
                  color1: Color(0xff20a033),
                  color2: Color(0xff60f52e),
                  buttonTitle: "Sign Up",
                  onTap: () {
                    print("sign up");
                  },
                ),
                const SizedBox(height: 10.0),
                LinearButton(
                  color1: Color(0xff2449e7),
                  color2: Color(0xed438cfc),
                  buttonTitle: "Back to Login",
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SignInScreen.id, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
