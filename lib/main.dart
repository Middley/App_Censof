import 'package:app_censo/Screens/login/login.dart';
import 'package:app_censo/constants.dart';
import 'package:flutter/material.dart'; // esta libreria proporciona widgets
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp()); //primera funcion que se ejecuta al correr nuestra app
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var loginScreen = LoginScreen;
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
      home: LoginScreen(),
    );
  }
}
