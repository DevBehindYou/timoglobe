// ignore: camel_case_types
// ignore_for_file: prefer_initializing_formals, empty_constructor_bodies, camel_case_types, duplicate_ignore, non_constant_identifier_names, depend_on_referenced_packages, avoid_print
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class serviceEngine {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDay;

  serviceEngine({this.location, this.flag, this.url});

  Future<void> getData() async {
    try {
      var response = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var body = await http.get(response);
      var data = jsonDecode(body.body);
      String datetime = data['datetime'];
      String offset01 = data['utc_offset'].substring(1, 3);
      String offset02 = data['utc_offset'].substring(4, 6);
      String sing = data['utc_offset'].substring(0, 1);
      DateTime nowTime = DateTime.parse(datetime);
      bool? isDaylightSavingTime = sing == '-' ? true : false;
      if (isDaylightSavingTime == true) {
        nowTime = nowTime.subtract(
            Duration(hours: int.parse(offset01), minutes: int.parse(offset02)));
      } else {
        nowTime = nowTime.add(
            Duration(hours: int.parse(offset01), minutes: int.parse(offset02)));
      }
      isDay = nowTime.hour > 6 && nowTime.hour < 20 ? true : false;
      time = DateFormat.jm().format(nowTime);
    } catch (error) {
      print('Error Occured: $error');
      time = 'error';
      isDay = true;
    }
  }
}
