import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/sierad.png'),
              new SizedBox(
                width: double.infinity,
                height: 50,
                child:
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {Navigator.pushNamed(context, '/dua');},
                  child: Text(
                      "Login",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "SFProText",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      textAlign: TextAlign.left
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

}