import 'package:flutter/material.dart';
import 'package:pattern_mobx/pages/create_page.dart';
import 'package:pattern_mobx/pages/home_page.dart';
import 'package:pattern_mobx/pages/update_page.dart';


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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        CreatePage.id: (context) => CreatePage(),
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
    );
  }
}

