import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';



class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences Preferences;
  String? tname;
  String? tuname;
  String? tphone;
  initState() {
    fetchData();
    super.initState();
  }
  void fetchData() async {
    Preferences = await SharedPreferences.getInstance()!;
    setState(() {
      tname = Preferences.getString('namekey')!;
      tuname = Preferences.getString('unamekey')!;
      tphone = Preferences.getString('phonekey')!;

    });




  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text( "My Profile",style: Theme.of(context).textTheme.displayLarge,),


      ),
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(

            children: [


              Icon(Icons.person,size: 70,color: Colors.grey,),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                Text("$tname"),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                Text("$tuname"),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                Text("$tphone"),
              ),



            ],
          ),
        ),
      ),
    );
  }

}



