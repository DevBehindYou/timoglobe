// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable, dead_code, empty_constructor_bodies, prefer_initializing_formals, depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:weather/server/server_engine_page.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Map? recivedData = {};
  @override
  Widget build(BuildContext context) {
    recivedData = recivedData!.isNotEmpty
        ? recivedData
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage;
    try {
      bgImage = recivedData?['isDay'] ? 'image_day.jpg' : 'image_night.png';
    } catch (error) {
      print(error);
      bgImage = 'error.jpg';
    }
    if (recivedData!['time'] == "error") {
      bgImage = 'error.jpg';
    }

    Future<void> reload() async {
      if (recivedData?['time'] != 'error') {
        serviceEngine instance = serviceEngine(
            location: recivedData!['location'].toString(),
            url: recivedData!['url'].toString());
        await instance.getData();
        setState(() {
          recivedData = {
            'location': instance.location,
            'url': instance.url,
            'flag': instance.flag,
            'time': instance.time,
            'isDay': instance.isDay
          };
        });
      }
      if (recivedData?['time'] == 'error') {
        serviceEngine instance = serviceEngine(
            location: recivedData!['location'].toString(),
            url: recivedData!['url'].toString());
        await instance.getData();
        setState(() {
          recivedData = {
            'location': instance.location,
            'url': instance.url,
            'flag': instance.flag,
            'time': instance.time,
            'isDay': instance.isDay
          };
        });
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff29283A),
      body: SafeArea(
        child: LiquidPullToRefresh(
          onRefresh: reload,
          color: Colors.grey[900],
          height: 270,
          animSpeedFactor: 2.0,
          showChildOpacityTransition: true,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pull Down to Refresh",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
              // main container
              Container(
                height: 680,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(45)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    // inner container + lication and time
                    GestureDetector(
                      onTap: () async {
                        try {
                          dynamic result = await Navigator.pushNamed(
                              context, '/locationpage');
                          setState(() {
                            recivedData = {
                              'location': result['location'],
                              'flag': result['flag'],
                              'time': result['time'],
                              'isDay': result['isDay'],
                              'url': result['url']
                            };
                          });
                        } catch (error) {
                          recivedData = recivedData;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        height: 600,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('image_assets/$bgImage'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Column(
                              children: [
                                SizedBox(height: 20),
                                Text(recivedData?['location'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        letterSpacing: 2.0)),
                                Divider(
                                  height: 60,
                                  color: Colors.white,
                                ),
                                Text("TIME",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        letterSpacing: 2.0)),
                                SizedBox(height: 10),
                                Text(recivedData?['time'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        letterSpacing: 1.0)),
                                SizedBox(height: 45),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // tap containor => choose location
              GestureDetector(
                onTap: () async {
                  try {
                    dynamic result =
                        await Navigator.pushNamed(context, '/locationpage');
                    setState(() {
                      recivedData = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDay': result['isDay'],
                        'url': result['url']
                      };
                    });
                  } catch (error) {
                    recivedData = recivedData;
                  }
                },
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.touch_app,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Tap to change Location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 2.0),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              // tap containor => select default location container
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/infopage');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
              SizedBox(height: 10)
            ],
          )),
        ),
      ),
    );
  }
}
