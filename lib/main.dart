import 'package:flutter/material.dart';
import 'main_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(), // Provide light theme
      //darkTheme: ThemeData.dark(), // Provide dark theme
      home: MainPage(),
    );
  }
}
