import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_newz/login.dart';
import 'package:the_newz/provider/sign_in_provider.dart';
import 'package:the_newz/sign_up.dart';
import 'package:the_newz/utils/next_screen.dart';
import 'package:the_newz/widgets/custom_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    Timer(const Duration(seconds: 600), () {
      sp.isSignedIn == false
          ? nextScreen(context, const Welcome())
          : nextScreen(context, const SignUpScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("images/background.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox(
            //   height: 150.0,
            // ),
            SizedBox(
              height: 73,
              width: 95,
              child: Image(
                  image: AssetImage("images/logo4.png"), fit: BoxFit.cover),
            ),

            const SizedBox(height: 10),
            // Text(
            //   "The Newz",
            //   style: TextStyle(
            //     fontSize: 17.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(height: 10),
            CustomizedButton(
              buttonText: "Login",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
            CustomizedButton(
              buttonText: "Register",
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()));
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Continue as a Guest",
                style: TextStyle(color: Color(0xff35C2C1), fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
