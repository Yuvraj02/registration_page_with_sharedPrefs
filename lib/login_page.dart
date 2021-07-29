import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:registration_form_new/home_screen.dart';

import 'form_provider.dart';

class LoginScreen extends StatefulWidget{
  LoginScreen();
  _LoginScreenSate_ createState() => _LoginScreenSate_();
}

class _LoginScreenSate_ extends State<LoginScreen>{

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(

        child: Consumer<FormProvider>(
          builder: (context,provider,child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                      provider.setUserName(userController.text);
                      provider.setPassword(passwordController.text);

                      if(provider.checkData()){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Logging In"),
                        ));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return HomeScreen();
                            }));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Invalid Username/Password"),
                        ));
                      }
                  },
                  child: Text("Log in"),
                ),
              ],
            );
          },
        )
      ),
    );
  }
}