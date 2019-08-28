import 'package:flutter/material.dart';
import 'package:sierad/succsess_page.dart';
import 'package:sierad/form_input.dart';
import 'package:sierad/login_screen.dart';
import 'package:sierad/splash_screen.dart';
import 'package:sierad/kandang.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => SplashScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/dua': (context) => Login(),
      '/tiga': (context) => Home(),
      '/empat': (contex) => scsPage(),
      '/lima': (context) => PilihKandang(),
    },
  ));
}

//class MyApp extends StatelessWidget {
// final appTitle = 'Sierad Demo';
//
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: appTitle,
//     home: Home(title: appTitle),
//   );
// }
//}

