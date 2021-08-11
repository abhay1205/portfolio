import 'package:flutter/material.dart';
import 'package:portFolio/profilr_page.dart';
import 'package:portFolio/project_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Color(0xFF022C43),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/project': (BuildContext context)=>ProjectPage()
      },
      home: ProfilePage(),
    );
  }
}

