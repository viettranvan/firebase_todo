import 'package:firebase_todo/screens/screens.dart';
import 'package:firebase_todo/services/auth.dart';
import 'package:firebase_todo/utils/utils.dart';
import 'package:firebase_todo/widgets/header.dart';
import 'package:firebase_todo/widgets/linear_button.dart';
import 'package:firebase_todo/widgets/reusable_textfield.dart';
import 'package:firebase_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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

  bool inAsyncCall = false;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isPasswordMatch = true;
  bool isObscureTextPass = true;
  bool isObscureTextRePass = true;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

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

    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: GestureDetector(
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
                      errorText: isEmailValid ? null : "Incorrect email format",
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
                      errorText: isPasswordValid ? null : "Incorrect password format",
                      onChange: (val){
                        setState(() {
                          hasUppercase = val.contains(RegExp(r'[A-Z]'));
                          hasNumber = val.contains(RegExp(r'[0-9]'));
                          hasLowercase = val.contains(RegExp(r'[a-z]'));
                          hasSpecialCharacter =
                              val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                          hasMinLength = val.length >= 6;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CheckPasswordValidate(
                        symbol: "A",
                        detail: "Uppercase",
                        condition: hasUppercase,
                      ),
                      CheckPasswordValidate(
                        symbol: "a",
                        detail: "Lowercase",
                        condition: hasLowercase,
                      ),
                      CheckPasswordValidate(
                        symbol: "1",
                        detail: "Number",
                        condition: hasNumber,
                      ),
                      CheckPasswordValidate(
                        symbol: "@",
                        detail: "Special",
                        condition: hasSpecialCharacter,
                      ),
                      CheckPasswordValidate(
                        symbol: "6+",
                        detail: "Min Length",
                        condition: hasMinLength,
                      ),
                    ],
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
                      errorText: isPasswordMatch ? null : "Password not match",
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  LinearButton(
                    color1: Color(0xff20a033),
                    color2: Color(0xff60f52e),
                    buttonTitle: "Sign Up",
                    onTap: () => onSignUp(context),
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
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    ) ;
  }
  onSignUp(BuildContext context) async{

    Validation validation = Validation();
    AuthMethods authMethods = AuthMethods();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String rePassword = _reEnterPasswordController.text.trim();

    setState(() {
      isEmailValid = validation.isValidEmail(email);
      isPasswordValid = validation.isValidPassword(password);
      isPasswordMatch = (password == rePassword);
    });

    if(isEmailValid && isPasswordValid && isPasswordMatch){
      setState(() {
        inAsyncCall = true;
      });
      await authMethods.createUserWithEmailAndPassword(email, password, context);
      setState(() {
        inAsyncCall = false;
      });
    }

  }

}


