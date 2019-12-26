import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'united-kingdom.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'united-states.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cario', flag: 'egypt.png'),
    WorldTime(url: 'America/Havana', location: 'Havana', flag: 'united-states.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'united-arab-emirates.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'Indian/Mauritius', location: 'Mauritius', flag: 'mauritius.png')

  ];

  void updateTime(index) async {
    WorldTime obj = locations[index];

    await obj.getTime();
    Navigator.pop(context, {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
      'isDayTime': obj.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[950],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  trailing: Icon(
                    Icons.line_weight
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                  onTap: () {
//                    print(locations[index].location);
                  updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              );
            }
        ),
      ),
    );
  }
}
