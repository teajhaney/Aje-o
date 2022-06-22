import 'package:ajeo_test/screens/home_screen.dart';
import 'package:ajeo_test/screens/login_screen.dart';

import 'package:ajeo_test/utils/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: mobileBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: black,
            ),
            headline2: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: black,
            ),
            bodyText1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
            bodyText2: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          )),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
