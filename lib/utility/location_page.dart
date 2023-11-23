// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_typing_uninitialized_variables, unused_element, avoid_print, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather/server/server_engine_page.dart';
import 'package:weather/utility/my_appbar.dart';

class locationPage extends StatefulWidget {
  locationPage({super.key});

  @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {
  List<serviceEngine> locations = [
    serviceEngine(
        location: 'Mexico City',
        flag: 'united-states.png',
        url: 'America/Mexico_City'),
    serviceEngine(
        location: 'New York',
        flag: 'united-states.png',
        url: 'America/New_York'),
    serviceEngine(
        location: 'Santiago',
        flag: 'united-states.png',
        url: 'America/Santiago'),
    serviceEngine(
        location: 'Mawson', flag: 'antarctica.png', url: 'Antarctica/Mawson'),
    serviceEngine(
        location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    serviceEngine(location: 'Beirut', flag: 'Lebanon.png', url: 'Asia/Beirut'),
    serviceEngine(
        location: 'Dubai', flag: 'united-arab-emirates.png', url: 'Asia/Dubai'),
    serviceEngine(
        location: 'Hong Kong', flag: 'hong-kong.png', url: 'Asia/Hong_Kong'),
    serviceEngine(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
    serviceEngine(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    serviceEngine(
        location: 'South Georgia',
        flag: 'united-kingdom.png',
        url: 'Atlantic/South_Georgia'),
    serviceEngine(
        location: 'Darwin', flag: 'australia.png', url: 'Australia/Darwin'),
    serviceEngine(
        location: 'Broken Hill',
        flag: 'australia.png',
        url: 'Australia/Broken_Hill'),
    serviceEngine(
        location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),
    serviceEngine(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    serviceEngine(
        location: 'London', flag: 'united-kingdom.png', url: 'Europe/London'),
    serviceEngine(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
    serviceEngine(location: 'Rome', flag: 'Italy.png', url: 'Europe/Rome'),
    serviceEngine(location: 'Vienna', flag: 'Vienna.png', url: 'Europe/Vienna'),
    serviceEngine(location: 'Chagos', flag: 'Chagos.png', url: 'Indian/Chagos'),
    serviceEngine(location: 'Tunis', flag: 'Tunis.png', url: 'Africa/Tunis'),
    serviceEngine(location: 'Lagos', flag: 'Nigeria.png', url: 'Africa/Lagos')
  ];

  void updateTimeLocation(Index) async {
    serviceEngine instance = locations[Index];
    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'url': instance.url,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: "Locations"),
      backgroundColor: Color(0xff29283A),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: Card(
              color: Colors.grey[800],
              child: ListTile(
                  onTap: () {
                    updateTimeLocation(index);
                  },
                  contentPadding:
                      EdgeInsets.only(left: 50.0, top: 5, bottom: 5),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('image_assets/${locations[index].flag}'),
                  ),
                  title: Text(
                    locations[index].location as String,
                    style: TextStyle(
                        color: Colors.white, fontSize: 25, letterSpacing: 2.0),
                  )),
            ),
          );
        },
      ),
    );
  }
}
