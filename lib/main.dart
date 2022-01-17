import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  final String title='Parse Local JSON';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: const HomeScreen(),
      routes: {
        '/home-screen':(_)=>const HomeScreen(),
      },
    );
  }
}