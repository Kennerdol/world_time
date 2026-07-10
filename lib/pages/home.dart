import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    // print(data);

    //Set background image
    String bgImage = data['isDaytime']? 'day.jpg' : 'night.jpg'; //#0283cb
    Color bgColor = data['isDaytime']? const Color.fromARGB(255, 2, 131, 203) : const Color.fromARGB(255, 18, 31, 57);


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/day_night/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                    ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle( 
                        color: Colors.white,
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'],
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          letterSpacing: 2.0,
                        ),
                ),
              ],
            ),
          ),
        ),
        ),
    );
  }
}