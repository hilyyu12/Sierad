import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:sierad/form_input.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  String phone;
  final _key = new GlobalKey<FormState>();

  check() {
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();
    }
  }
  
  login() async{
    final response = await http.post("http://35.201.8.6:5002/api/v1/login/", body: {"phone": phone});
    final data = jsonDecode(response.body);
    print(data);
    if(response.statusCode == 200){
      Navigator.pushNamed(context, '/lima');
    }
    else{
      return "NOMER TIDAK TERDAFTAR";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body:
          Form(
            key: _key,
              child: Center(
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

                    Material(
                      child: TextFormField(
                        // ignore: missing_return
                        validator: (e){
                          if(e.isEmpty){
                            return "WAJIB DI ISI";
                          }
                        },
                        onSaved: (e) => phone = e,
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
                    ),

                    new Padding(padding: EdgeInsets.only(top: 70.0)),
                    SizedBox(
                      width: 319,
                      height: 54,
                      child:
                      RaisedButton(
                          color: Colors.green,
                          shape: StadiumBorder(),
                          onPressed: ()
//                        {Navigator.pushNamed(context, '/tiga');},
                      {check();}
                          ,
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
          )
      ),
    );
  }

}