import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; //Name for the UI
  String? time; // Time in that location
  String? flag; //url to and asset flag icon
  String? url; // Location url for API endpoint
  bool? isDaytime; // true or false if daytime or night time

  WorldTime({this.location, this.flag, this.url});


   Future<void> getTime() async {

    try{
      // Make request
      final Response response = await get(Uri.parse('http://time.now/developer/api/timezone/$url'),);
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

      // Set time property
      isDaytime =  now.hour > 6 && now.hour < 23 ? true: false;
      time = DateFormat.jm().format(now);

    }
    catch (e){
      // print("Caught error: $e");
      time = "Enable to get data!";
    }
    
  }

}

//WorldTime wt =WorldTime(location: 'Lusaka', flag: "Zed.png", url: "Africa/Lusaka");
