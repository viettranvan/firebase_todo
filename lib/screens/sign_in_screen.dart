import 'package:flutter/material.dart';
import 'package:firebase_todo/utils/utils.dart';
import 'package:firebase_todo/widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'sign_in_screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    Widget _togglePassword = GestureDetector(
      onTap: () => setState(() {
        isObscureText = !isObscureText;
      }),
      child:
          isObscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
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
                FlutterLogo(size: 150),
                const SizedBox(height: 10.0),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText("Todo App",textStyle: kAppTitle)
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ReusableTextField(
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: "Please enter your email",
                    errorText: null,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    suffixIcon: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ReusableTextField(
                    controller: _passwordController,
                    obscureText: isObscureText,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hintText: "Please enter your password",
                    errorText: null,
                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                    suffixIcon: _togglePassword,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => print("forgot password"),
                      child: Text(
                        "Forgot password",
                        style:
                            TextStyle(color: Color(0xff2449e7), fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 20.0)
                  ],
                ),
                const SizedBox(height: 10.0),
                LinearButton(
                  color1: Color(0xff2449e7),
                  color2: Color(0xed438cfc),
                  buttonTitle: "Login",
                  onTap: () {
                    print("on tap");
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Divider(
                            thickness: 2.0,
                            endIndent: 20.0,
                            indent: 20.0,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                    Text('or sign in with'),
                    Expanded(
                      child: Column(
                        children: [
                          Divider(
                              thickness: 2.0,
                              endIndent: 20.0,
                              indent: 20.0,
                              color: Colors.black54),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => print("Sign in with google"),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/logo_google.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print("Sign in with facebook"),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/logo_facebook.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
