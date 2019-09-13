import 'package:flutter/material.dart';
//import 'package:responsive_container/responsive_container.dart';
//import 'package:sierad/form_input.dart';
import 'package:http/http.dart' as http;
import 'package:sierad/monthly_input.dart';
import 'dart:convert';
import 'package:sierad/history.dart';
import 'package:responsive_container/responsive_container.dart';

class Lantai {
  String nama_lantai;


  Lantai({
    this.nama_lantai,

  });

  factory Lantai.fromJson(Map<String, dynamic> json) {
    return Lantai(
      nama_lantai: json['nama_lantai'],

    );
  }
}


class PilihKandang extends StatefulWidget{
  @override
  _PilihKandangState createState() => _PilihKandangState();
}
class _PilihKandangState extends State<PilihKandang>{
  final String uri = 'http://35.201.8.6:5004/api/v1/lantai/';
  Lantai _currentLantai;

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://35.201.8.6:5004/api/v1/kandang/"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    print(data);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<List<Lantai>> _fetchUsers() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Lantai> listOfUsers = items.map<Lantai>((json) {
        return Lantai.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ResponsiveContainer(widthPercent: 90, heightPercent: 98,
          child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context,int index){
              return new Card(
                child: new Container(
                  child: new Row(
                    children: <Widget>[
                      new Text(data[index]["nama_kandang"],
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                            fontStyle:  FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontFamily: "SFProText"
                        ),),
                      Padding(padding: EdgeInsets.only(right: 100.0),),
                      FutureBuilder<List<Lantai>>(
                          future: _fetchUsers(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Lantai>> snapshot) {
                            if (!snapshot.hasData) return CircularProgressIndicator();
                            return DropdownButton<Lantai>(
                              items: snapshot.data
                                  .map((lantai) => DropdownMenuItem<Lantai>(
                                child: new Column(
                                  children: <Widget>[
                                    FlatButton(
                                      child: Text(lantai.nama_lantai,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                            fontStyle:  FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "SFProText"
                                        ),),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Month()),);
                                      },
                                    )
                                  ],
                                ),
                                value: lantai,
                              ))
                                  .toList(),
                              onChanged: (Lantai value) {
                                setState(() {
                                  _currentLantai = value;
                                });
                              },
//                              isExpanded: false,
                              elevation: 50,
                              isDense: true,
                              iconSize: 45.0,

                            );
                          }),
                    ],
                  ),

                ),
              );
            },
          ),),
        ),


        endDrawer: new Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                accountName: Text("William Samantha",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 20.0
                    )),
                accountEmail: Text("Head of Operataion",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 15.0
                    )),
                currentAccountPicture: Image.asset("assets/ava2.png"),
              ),
              new Padding(padding: EdgeInsets.only(top: 40.0)),
              ListTile(
                title: Text("Kandang",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 17.0
                    )),
                onTap: () {Navigator.pushNamed(context, '/Lima');},
              ),
              ListTile(
                title: Text("Riwayat Input",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 17.0
                    )),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => History()),);},
              ),
              ListTile(
                title: Text("Kebijakan",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 17.0
                    )),
//                onTap: () {Navigator.pushNamed(context, '/lima');},
              ),
              ListTile(
                title: Text("Pengaturan Akun",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 17.0
                    )),
//                   onTap: () {Navigator.pushNamed(context, '/second');},
              ),

              new Padding(padding: EdgeInsets.only(top: 100.0)),
              new Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: ListTile(
                    title: Text("LOGOUT",
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontFamily: "SFProText",
                            fontStyle:  FontStyle.normal,
                            fontSize: 20.0
                        )),
                    onTap: () {Navigator.pushNamed(context, '/');},
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}