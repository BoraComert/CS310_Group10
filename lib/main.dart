import 'package:flutter/material.dart';
import 'package:flutter_demo/home_page1.dart';
import 'package:flutter_demo/register.dart';
import 'package:flutter_demo/terms_policy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage1());
  }
}
