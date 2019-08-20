import 'package:flutter/material.dart';
import 'package:sierad/api_service.dart';
import 'package:sierad/form_input.dart';


class Urls {
  static const BASE_API_URL = "http://35.201.8.6:5001/api/v1/login/";
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  bool _isLoading = false;
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Masukan nomor telepon anda untuk verifikasi data',
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontStyle:  FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SFProText"),
                  textAlign: TextAlign.center,),
                new Padding(padding: EdgeInsets.only(top: 60.0)),

                TextField(
                  controller: _phoneController,

                textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey,
                      fontStyle:  FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SFProText"
                  ),
                  decoration: new InputDecoration(
                    border: InputBorder.none
                  ),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                ),

                new Padding(padding: EdgeInsets.only(top: 70.0)),
                Container(height: 20,),
                _isLoading ? CircularProgressIndicator() : SizedBox(
                  width: 319,
                  height: 54,
                  child:
                  RaisedButton(
                      color: Colors.green,
                      shape: StadiumBorder(),
                      onPressed: () async {
                        print(_phoneController);
//                        Navigator.pushNamed(context, '/second');
//                        setState(() {
//                          _isLoading = true;
//                        });
                        final users = await ApiService.getUserList();
//                        setState(() {
//                          _isLoading = false;
//                        });
                        if (users == null) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text("Check your internet connection"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              }
                          );
                          return;
                        } else {
                          final userWithUsernameExists = users.any((u) => u['phone'] == int.parse(_phoneController.text));
                          print(_phoneController);
                          if (userWithUsernameExists) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()
                                )
                            );
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Incorrect username'),
                                    content: Text('Try with a different username'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Ok'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                }
                            );
                          }
                        }
                      },
                      child:   Text(
                          "Lanjutkan",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "SFProText",
                              fontStyle:  FontStyle.normal,
                              fontSize: 20.0
                          ),
                          textAlign: TextAlign.left
                      )),
                ),

              ],
            ),
          )
      ),
    );
  }

}