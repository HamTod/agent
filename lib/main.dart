
import 'package:agent/pages/agents.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,

            ),
            headline6: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,

            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
          )),
      home: AgentsPage(),
      routes: {
        //'/login': (context) => const LoginPage(),
        //'agent': (context) => const AgentsPage(),
        //'/detail':(context) => const Detail(),
      },
      //initialRoute: '/login',
    );
  }
}