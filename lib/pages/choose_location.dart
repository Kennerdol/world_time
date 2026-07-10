import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: "Africa/Lusaka", location: "Lusaka", flag: 'zambia.svg'),
    WorldTime(url: "Europe/London", location: "London", flag: 'uk.svg'),
    WorldTime(url: "America/New_York", location: "New York", flag: 'usa.svg'),
    WorldTime(url: "America/Chicago", location: "Chicago", flag: 'usa.svg'),
    WorldTime(url: "Africa/Cairo", location: "Cairo", flag: 'egypt.svg'),
    WorldTime(url: "Asia/Seoul", location: "Seoul", flag: 'south_korea.svg'),
    WorldTime(url: "Europe/Berlin", location: "Berlin", flag: 'greece.svg'),
    WorldTime(url: "Asia/Jakarta", location: "Jakarta", flag: 'indonesia.svg '),
  ];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 137, 137),

      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){},
              title: Text(locations[index].location??""),
              leading: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/flags/${locations[index].flag}"),
              ),
            ),
          );
        },
      ),
    );
  }
}