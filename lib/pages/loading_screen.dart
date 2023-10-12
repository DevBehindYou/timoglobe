// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, avoid_print, use_build_context_synchronously, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:weather/pages/server_engine_page.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  Future<void> setupWorldTime() async {
    serviceEngine instance = serviceEngine(
        location: 'Dubai', flag: 'united-arab-emirates.png', url: 'Asia/Dubai');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/homepage', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[700],
        body: LiquidPullToRefresh(
          onRefresh: setupWorldTime,
          color: Colors.grey[900],
          height: 270,
          animSpeedFactor: 2.0,
          showChildOpacityTransition: true,
          child: ListView(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          "PULL DOWN",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 50),
                      Center(
                          child: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                        size: 60,
                      )),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          "START",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 200,
                    child: Image(
                        image: AssetImage(
                      'image_assets/ico.png',
                    )),
                  ),
                ),
              )
            ],
          ), // scroll view
        ));
  }
}
