import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(GDGCApp());
}

class GDGCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDGC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
