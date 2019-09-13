import 'package:flutter/material.dart';
//import 'package:sierad/api_service.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:sierad/succsess_page.dart';
//import 'package:sierad/succsess_page.dart';
import 'package:sierad/form_input.dart';



class Post {
  final String awal_populasi;
  final String catatan;

  Post({
    this.awal_populasi,
    this.catatan,});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        awal_populasi: json['awal_populasi'],
        catatan: json['catatan'],
    );
  }



  Map toMap() {
    var map = new Map<String, dynamic>();
    map["awal_populasi"] = awal_populasi;
    map["catatan"] = catatan;
    return map;
  }
}

Future<Post>createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(statusCode);

    if (statusCode == 200 || statusCode == 201 ) {
      BuildContext context;
      Navigator.push(context, new MaterialPageRoute(builder: (context) =>new Home()));
    }
    return Post.fromJson(json.decode(response.body));
  });

}


class Month extends StatelessWidget{
  final Future<Post> post;


  Month({Key key, this.post}) : super(key: key);
//   ignore: non_constant_identifier_names
  static final Create_Post_Url = 'http://35.201.8.6:5004/api/v1/MonthlyInput/';
  TextEditingController awal_populasi = new TextEditingController();
  TextEditingController catatan = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
//      title: "WEB SERVICE",
      home: Scaffold(
        body:
        Form(
          child: Center(
//            child: new AspectRatio(
//                aspectRatio: 100/50,
            child: ResponsiveContainer(
              widthPercent: 90,
              heightPercent: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("Populasi Awal",
                    style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.grey,
                        fontStyle:  FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText"
                    ),),
//                new Padding(padding: EdgeInsets.only(top: 15.0)),

                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
//                        heightPercent: 5.0, //value percent of screen total height
//                        widthPercent: 5.0,
                          child: Text(
                            "Populasi Awal",
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
                  new Padding(padding: EdgeInsets.only(top: 6.0)),
                  new SizedBox(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          child:new Flexible(
                            child:  TextFormField(
                              controller: awal_populasi,
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
                              keyboardType: TextInputType.text,
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
                            "Catatan",
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
                            child:  TextFormField(
                              controller: catatan,
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                  fontStyle:  FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "SFProText"
                              ),
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              autofocus: true,
                              maxLength: 300,
                              maxLines: 10,
                            ),
                          ),//flexible
                        ),//container
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
                          Post newPost = new Post (awal_populasi: awal_populasi.text,catatan: catatan.text, );
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
                onTap: () {Navigator.pushNamed(context, '/his');},
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


//
//void main() => runApp(Home());