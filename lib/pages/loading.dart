import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/main.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setTime() async {
  WorldTime obj = WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
  await obj.getTime();
  setState(() {
    time = obj.time;
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(time),
        ),
      ),
    );
  }
}
