import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                label: Text('Edit location',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
                ),),
                icon: Icon(
                  Icons.add_location
                ),
              )
            ],
          )
    ),
    );
  }
}