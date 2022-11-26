
import 'package:flutter/material.dart';
import 'views/HomePage.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
