import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_newz/firebase_options.dart';
import 'package:the_newz/home.dart';
import 'package:the_newz/login.dart';
import 'package:the_newz/provider/sign_in_provider.dart';
import 'package:the_newz/sign_up.dart';
import 'package:the_newz/welcome_screen.dart';

import 'provider/internet_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SignInProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
      ],
      child: const MaterialApp(
        home: Welcome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
