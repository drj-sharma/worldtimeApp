import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.png';  // for backgorund image
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 80.0),
          child: SafeArea(
              child: Column(
                children: <Widget>[
                  Center(
                    child: FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        data = {
                          'location': result['location'],
                          'flag': result['flag'],
                          'time': result['time'],
                          'isDayTime': result['isDayTime']
                        };
                      },
                      label: Text('Edit location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,

                      ),),
                      icon: Icon(
                        Icons.add_location,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          fontStyle: FontStyle.normal,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                      )
                  )
                ],
              )
    ),
        ),
      ),
    );
  }
}
