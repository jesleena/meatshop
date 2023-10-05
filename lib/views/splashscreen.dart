import 'dart:async';
import 'package:flutter/material.dart';
import 'sign_signup.dart';
import '/controller/productprovider.dart';
import 'package:provider/provider.dart';



class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState(); //create and initial state for the screen
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Sign_Signup()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          CircleAvatar(
            radius: 100,
          backgroundImage:AssetImage("assets/images/logo.jpeg"),),

              Text( "Eat Fresh",style: Theme.of(context).textTheme.displayMedium, ),
            ],
          ),
        ),
      ),
    );
  }
}

