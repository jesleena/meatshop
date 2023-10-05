
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final uname = TextEditingController();
  final passwd = TextEditingController();
  bool _obscureText = true;
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    _loadUserCredentials();
  }

  _loadUserCredentials() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text( "login", style: Theme.of(context).textTheme.displayMedium,) ,
              const SizedBox(height: 10,),
              const Text("Welcome back, login with your credentials"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(style: Theme.of(context).textTheme.bodyMedium,
                  controller: uname,
                  decoration: const InputDecoration(
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
                  controller: passwd,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  validateAndLogin();
                },
                child: Text("Login" ,style: Theme.of(context).textTheme.bodySmall ),

              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>RegistrationPage()));
                },
                child: Text("Don't have an account? Sign Up",style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndLogin() {
    String storedUsername = preferences.getString('unamekey') ?? '';
    String storedPassword = preferences.getString('passkey') ?? '';

    // Values that we entered in the text fields
    String username = uname.text;
    String password = passwd.text;

    if (storedUsername == username && storedPassword == password) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homee()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid username or password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
