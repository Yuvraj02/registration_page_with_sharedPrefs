import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_form_new/form_provider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState_ createState() => _HomeScreenState_();
}

class _HomeScreenState_ extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Consumer<FormProvider>(builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: provider.isLoading(),
                child: Container(
                    margin: EdgeInsets.only(top: 50, bottom: 30),
                    child: CircularProgressIndicator()),
              ),
              Visibility(
                visible: provider.loadHomeScreen(),
                child: Container(
                    margin: EdgeInsets.only(top: 50, bottom: 30),
                    child: Text("Welcome")),
              ),
            ],
          );
        }),
      ),
    );
  }
}
