import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text(
          "SuConnect",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
          actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
        body:Center(child: Column(children: [
          
          
                       
                       
      ]
     )),
     )
    );
  }
}
