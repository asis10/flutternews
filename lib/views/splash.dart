import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutternews/views/home.dart';
import 'package:lottie/lottie.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body:
      Center(
        child: 
        Lottie.network('https://assets6.lottiefiles.com/datafiles/KbKSrbWahtNPvY6/data.json'),
      ),
      
    
    
    );
  }
}

