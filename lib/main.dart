// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_demo1/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter widget demo',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routes: routes,
    );
  }
}
