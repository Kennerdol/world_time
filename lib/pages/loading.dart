import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time = 'Loading...';

  void setupWorlTime() async {
    WorldTime instance =WorldTime(location: 'Lusaka', flag: "Zed.png", url: "Africa/Lusaka");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location, 
      "flag": instance.flag, 
      "time": instance.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorlTime();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text("Loading..."),
      )
    );
  }
}