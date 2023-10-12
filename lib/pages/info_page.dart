// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class infoPage extends StatelessWidget {
  const infoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(1),
            height: 140,
            width: 140,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'image_assets/pantsuService.jpeg',
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  "Hello, I'am AshDev this project is open source so if you want to use it and make it batter Please go ahead, it will be really big help to me, Upgrage, Debugging will continue for some time. \n API Used: WorldTimeAPI",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      backgroundColor: Colors.grey[800]),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
