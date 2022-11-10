import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Body Mass Index',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          headline1: TextStyle(
                 fontSize: 30,
                 fontWeight: FontWeight.w800,
                 color: Colors.white,
        ),
        headline2: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
        ),
        bodyText1: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
        ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        ),
      home:  MyHomePage(),
    );
  }
}

