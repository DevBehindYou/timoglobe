// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:weather/utility/my_appbar.dart';

class infoPage extends StatelessWidget {
  const infoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: "About"),
      backgroundColor: Color(0xff29283A),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('image_assets/DevProfileImage.png'),
              ),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Hello, I'am DevBehondYou this project is open source so if you want to use it and make it batter Please go ahead, it will be really big help to me, Upgrage, Debugging will continue for some time. \n API Used: WorldTimeAPI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xff5F5EF7),
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
