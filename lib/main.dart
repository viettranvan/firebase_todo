import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_todo/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirebaseTodo());
}

class FirebaseTodo extends StatelessWidget {
  const FirebaseTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignInScreen.id,
      routes: {
        SignInScreen.id: (context) => SignInScreen()
      },
    );
  }
}
