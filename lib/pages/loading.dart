import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setTime() async {
  WorldTime obj = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
  await obj.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': obj.location,
    'flag': obj.flag,
    'time': obj.time,
    'isDayTime': obj.isDayTime
  });
  }
  @override
  void initState() {
    setTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[600],
      body: Center(
          child: SpinKitSquareCircle (
            color: Colors.black,
            size: 50.0,
          )
      ),
    );
  }
}
