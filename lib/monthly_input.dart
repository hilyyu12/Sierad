import 'package:flutter/material.dart';
//import 'package:sierad/api_service.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:sierad/succsess_page.dart';
//import 'package:sierad/succsess_page.dart';

class Post {
  final String death;
  final String execution;

  Post({
    this.death,
    this.execution,});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        death: json['death'],
        execution: json['execution'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["death"] = death;
    map["execution"] = execution;
    return map;
  }
}




// ignore: must_be_immutable
class Home extends StatelessWidget{
  final Future<Post> post;

  Home({Key key, this.post}) : super(key: key);
//   ignore: non_constant_identifier_names
  static final Create_Post_Url = 'http://35.201.8.6:5002/api/v1/SieradProduce/';
  TextEditingController death = new TextEditingController();
  TextEditingController execution = new TextEditingController();


  Future<Post> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      print(statusCode);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      else{

      }
      return Post.fromJson(json.decode(response.body));
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
//      title: "WEB SERVICE",
      home: Scaffold(
        body:
        Center(
//            child: new AspectRatio(
//                aspectRatio: 100/50,
            child: ResponsiveContainer(
              widthPercent: 90,
              heightPercent: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new Column(
                    children: <Widget>[
                      Text("Daily Input",
                        style: const TextStyle(
                            fontSize: 25.0,
                            color: Colors.grey,
                            fontStyle:  FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontFamily: "SFProText"
                        ),),
//                IconButton(icon: Image.asset("assets/ava.png"), onPressed: (){Scaffold.of(context).openDrawer();})

                    ],
                  ),
//                new Padding(padding: EdgeInsets.only(top: 15.0)),

                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
//                        heightPercent: 5.0, //value percent of screen total height
//                        widthPercent: 5.0,
                          child: Text(
                            "Mati",
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                                fontStyle:  FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontFamily: "SFProText"
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  new SizedBox(
//
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          child:new Flexible(
//                          flex: 5,
                            child:  TextField(
                              controller: death,
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                  fontStyle:  FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "SFProText"
                              ),
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              autofocus: true,
                            ),
                          ),//flexible
                        ),//container
                        new Text("   Ekor",
                          style: const TextStyle(
                              fontSize: 19.0,
                              color: Colors.grey,
                              fontStyle:  FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: "SFProText"
                          ),),
                      ],//widget
                    ),
                  ),

                  new Padding(padding: EdgeInsets.only(top: 10.0)),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            "Eksekusi",
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                                fontStyle:  FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontFamily: "SFProText"
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  new SizedBox(
//                  width: 335,
//                  height: 35,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          child:new Flexible(
                            child:  TextField(
                              controller: execution,
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                  fontStyle:  FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "SFProText"
                              ),
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              autofocus: true,
                            ),
                          ),//flexible
                        ),//container
                        new Text("   Ekor",
                          style: const TextStyle(
                              fontSize: 19.0,
                              color: Colors.grey,
                              fontStyle:  FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: "SFProText"
                          ),),
                      ],//widget
                    ),
                  ),

                  new Padding(padding: EdgeInsets.only(top: 15.0)),
                  new SizedBox(
                    width: double.infinity,
                    height: 45,
                    child:
                    RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(),
                        onPressed: ()
                        async   {
                          Post newPost = new Post (death: death.text,execution: execution.text, );
                          await createPost(Create_Post_Url, body: newPost.toMap());
                        },
                        child:   Text(
                            "LANJUTKAN",
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
              ),)
//            )
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
                title: Text("Halaman Utama",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 17.0
                    )),
                onTap: () {Navigator.pushNamed(context, '/tiga');},
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
                onTap: () {Navigator.pushNamed(context, '/tiga');},
              ),
              ListTile(
                title: Text("Daftar Kandang",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText",
                        fontStyle:  FontStyle.normal,
                        fontSize: 17.0
                    )),
                onTap: () {Navigator.pushNamed(context, '/lima');},
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

//
//void main() => runApp(Home());