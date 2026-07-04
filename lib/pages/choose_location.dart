import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  void getData(){

    //Simulate network request for a username
    Future.delayed(Duration(seconds: 3), (){
      print('Kenny');
    });

    //Simulate network request to get bio of a username
    Future.delayed(Duration(seconds: 3), (){
      print('Kenny');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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

      body: OutlinedButton(onPressed: (){
        setState(() {
          counter++;
        });
      },
      child: Text('Counter is: $counter'),
      ),
    );
  }
}