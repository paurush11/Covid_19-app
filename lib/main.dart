import 'package:covid_19app/screens/loading.dart';
import 'package:flutter/material.dart';
import 'screens/Firstscreen.dart';
import 'screens/SecondScreen.dart';
import 'screens/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoadingScreen(),
        '/first': (context) =>FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),

      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E20),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),

    );
  }
}

