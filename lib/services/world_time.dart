import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  String location; // location name for UI
  String time;    // time in the location
  String flag;   // url to an asset flag action
  String url;   // location url for api endpoint
  bool isDayTime; // true for Daytime, false for night time

  WorldTime({this.location, this.flag, this.url});

  Future <void> getTime() async {

    try {
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);
//    print(data);
      String datetime = data['datetime'];
//    print(datetime);
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);
//    print(offsetMinutes);

      // create datetime obj
      DateTime now = DateTime.parse(datetime);
      // add offset to the time
      // non destructive function, therefore we've to update now variable
      now = now.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

      isDayTime = (now.hour > 6) && (now.hour < 20) ? true : false;

      time = DateFormat.jm().format(now);
      print(time);
    }
    catch(e) {
      print('error caught: , $e');
      time = 'could not get time data';
    }
  }

}