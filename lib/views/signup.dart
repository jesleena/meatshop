import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';


class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final phone_ctrl = TextEditingController();
  final password_ctrl = TextEditingController();
  late SharedPreferences Preferences;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Image.asset('assets/icon1.png',  height: 100, width: 100, ),
              Text( "Sign up",style: Theme.of(context).textTheme.displayMedium,) ,
              SizedBox(height: 10,),
              Text( "Please enter the details below to continue" ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(style: Theme.of(context).textTheme.bodyMedium,
                  controller: name_ctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(style: Theme.of(context).textTheme.bodyMedium,
                  controller: uname_ctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                    labelText: "Username",
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(style: Theme.of(context).textTheme.bodyMedium,
                  controller: phone_ctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Phone",
                    labelText: "Phone",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),




              Padding(
                padding: const EdgeInsets.all(12.0),
                child:  TextField(style: Theme.of(context).textTheme.bodyMedium,
                  controller: password_ctrl,
                  obscureText: _obscureText,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                    hintText: "password ",
                    // hintStyle: textHintStyle,
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: _obscureText == true
                        ? IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = false;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          size: 20
                        ))
                        : IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = true;
                          });
                        },
                        icon: Icon(
                          Icons.visibility_off,
                          size: 20
                        )),
                  ),
                ),),
    ElevatedButton(
                onPressed: () {
                 storedata();},
                 child: Text("SignUp" ,style: Theme.of(context).textTheme.bodySmall ),),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>LoginPage()));
                },
                child: Text("Do have an account? Login",style: Theme.of(context).textTheme.bodyMedium),
              ),


            ],
          ),
        ),
      ),
    );
  }
  void storedata() async {
    String personname = name_ctrl.text;
    String username = uname_ctrl.text;
    String password = password_ctrl.text;
    String phone = phone_ctrl.text;

    Preferences = await SharedPreferences.getInstance()!;
    Preferences.setString('namekey', personname);
    Preferences.setString('unamekey', username);
    Preferences.setString('passkey', password);
    Preferences.setString('phonekey', phone);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}


