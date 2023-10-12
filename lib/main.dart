// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/pages/info_page.dart';
import 'package:weather/pages/loading_screen.dart';
import 'package:weather/pages/location_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => loadingScreen(),
        '/homepage': (context) => homePage(),
        '/locationpage': (context) => locationPage(),
        '/infopage': (context) => infoPage()
      },
    );
  }
}
