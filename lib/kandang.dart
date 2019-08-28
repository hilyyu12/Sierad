import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

class PilihKandang extends StatefulWidget{
  @override
  _PilihKandangState createState() => _PilihKandangState();
}
class _PilihKandangState extends State<PilihKandang>{
  var _value = "1";

  DropdownButton _itemDown() => DropdownButton<String>(
    items: [
      DropdownMenuItem(
        value: "3",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              "Kandang",
            ),
          ],
        ),
      ),
      DropdownMenuItem(
        value: "1",
        child:
          RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/tiga');
              },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 10),
              Text(
                "Lantai 1",
              ),
            ],
          ),
          )
      ),
      DropdownMenuItem(
          value: "2",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 2",
                ),
              ],
            ),
          )
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    isDense: true,
    value: _value,
    isExpanded: true,
  );

  DropdownButton _itemDown2() => DropdownButton<String>(
    items: [
      DropdownMenuItem(
        value: "3",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              "Kandang",
            ),
          ],
        ),
      ),
      DropdownMenuItem(
          value: "1",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 1",
                ),
              ],
            ),
          )
      ),
      DropdownMenuItem(
          value: "2",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 2",
                ),
              ],
            ),
          )
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    isDense: true,
    value: _value,
    isExpanded: true,
  );

  DropdownButton _itemDown3() => DropdownButton<String>(
    items: [
      DropdownMenuItem(
        value: "3",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              "Kandang",
            ),
          ],
        ),
      ),
      DropdownMenuItem(
          value: "1",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 1",
                ),
              ],
            ),
          )
      ),
      DropdownMenuItem(
          value: "2",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 2",
                ),
              ],
            ),
          )
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    isDense: true,
    value: _value,
    isExpanded: true,
  );

  DropdownButton _itemDown4() => DropdownButton<String>(
    items: [
      DropdownMenuItem(
        value: "3",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              "Kandang",
            ),
          ],
        ),
      ),
      DropdownMenuItem(
          value: "1",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 1",
                ),
              ],
            ),
          )
      ),
      DropdownMenuItem(
          value: "2",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 2",
                ),
              ],
            ),
          )
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    isDense: true,
    value: _value,
    isExpanded: true,
  );

  DropdownButton _itemDown5() => DropdownButton<String>(
    items: [
      DropdownMenuItem(
        value: "3",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              "Kandang",
            ),
          ],
        ),
      ),
      DropdownMenuItem(
          value: "1",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 1",
                ),
              ],
            ),
          )
      ),
      DropdownMenuItem(
          value: "2",
          child:
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tiga');
            },
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  "Lantai 2",
                ),
              ],
            ),
          )
      ),
    ],
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    isDense: true,
    value: _value,
    isExpanded: true,
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ResponsiveContainer(
              widthPercent: 90,
              heightPercent: 90,
              child: Column(
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _itemDown(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _itemDown2(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _itemDown3(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _itemDown4(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _itemDown5(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
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