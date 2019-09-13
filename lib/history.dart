import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_container/responsive_container.dart';
import 'package:sierad/kandang.dart';

class Riwayat {
  final String panen, execution, dead, afkir, date;


  Riwayat._({
    this.panen,
    this.execution,
    this.dead,
    this.afkir,
    this.date
    });


  factory Riwayat.fromJson(Map<String, dynamic> json) {
    return new Riwayat._(
      panen: json['panen'].toString(),
      execution: json['execution'].toString(),
      dead: json['dead'].toString(),
      afkir: json['afkir'].toString(),
      date: json['created'].toString(),

    );
  }
}

class History extends StatefulWidget{
  @override
  _HistoryState createState() => _HistoryState();
}
class _HistoryState extends State<History>{
  List<Riwayat> list = List();
  var isLoading = false;

   getData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get("http://35.201.8.6:5004/api/v1/DailyInput/");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Riwayat.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ResponsiveContainer(widthPercent: 90, heightPercent: 98,
            child: ListView.builder(
                itemCount: list == null ? 0 : list.length,
                itemBuilder: (BuildContext context,int index){
                  return new Card(
                    child: new Container(
                        width: double.infinity,
                        height: 230,
                        child: Column(
                          children: <Widget>[
                            new Padding(padding: EdgeInsets.only(top: 15.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new Text(list[index].date,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                      fontStyle:  FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "SFProText"
                                  ),)
                              ],
                            ),

                            new Padding(padding: EdgeInsets.only(top: 15.0)),
                            SizedBox(
                              width: double.infinity,
                              height: 1,
                              child: Container(
                                color: Colors.grey,
                              ),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 20.0)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                new Row(
                                  children: <Widget>[
                                    Image.asset('assets/image_3.png',width: 40.0,),
                                    new Text(list[index].dead,
                                      style: const TextStyle(
                                          fontSize: 26.0,
                                          color: Colors.grey,
                                          fontStyle:  FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "SFProText"
                                      ),),
                                  ],
                                ),

                                new Row(
                                  children: <Widget>[
                                    Image.asset('assets/image_4.png',width: 40.0,),
                                    new Text(list[index].afkir,
                                      style: const TextStyle(
                                          fontSize: 26.0,
                                          color: Colors.grey,
                                          fontStyle:  FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "SFProText"
                                      ),),
                                  ],
                                )
                              ],
                            ),

                            new Padding(padding: EdgeInsets.only(top: 40.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    Image.asset('assets/image_2.png',width: 40.0,),
                                    new Text(list[index].execution,
                                      style: const TextStyle(
                                          fontSize: 26.0,
                                          color: Colors.grey,
                                          fontStyle:  FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "SFProText"
                                      ),),
                                  ],
                                ),

                                new Row(
                                  children: <Widget>[
                                    Image.asset('assets/image_1.png',width: 40.0,),
                                    new Text(list[index].panen,
                                      style: const TextStyle(
                                          fontSize: 26.0,
                                          color: Colors.grey,
                                          fontStyle:  FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "SFProText"
                                      ),),
                                  ],
                                )
                              ],
                            ),
                  ]
                  )
                    ),
                  );
                }),
          ),
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
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PilihKandang()),);},
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