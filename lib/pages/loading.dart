import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   void getTime() async {
    // Make request
    final Response response = await get(Uri.parse('http://time.now/developer/api/timezone/Africa/Lusaka'),);
    Map data = jsonDecode(response.body);
    // print(data);

    // Get from data
    String dateTime = data["datetime"];

    // Creating a substring to get the first two characters of the utc_offset string. 
    //This is because the offset is in the format of +02:00 or -05:00, 
    //and we only want the hour part of it.
    String offset = data["utc_offset"].substring(1, 3); 

    // print("Offset: $offset");
    // print("Date Time: $dateTime");


    // // Create a DateTime object
    DateTime now = DateTime.parse(dateTime);
    now  = now.add(Duration(hours: int.parse(offset)));
    print(" Now: $now");
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading screen...")
    );
  }
}