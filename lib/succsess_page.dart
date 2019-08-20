import 'package:flutter/material.dart';

// ignore: camel_case_types
class scsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.12363281100988388, 0.12076587975025176),
              end: Alignment(1.2712695598602295, 1.106432557106018),
              colors: [const Color(0xff00be39), const Color(0xff8de748)])
      ),
      child: new Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Container(
               width: 129.3916015625,
               height: 129.391357421875,
               decoration: BoxDecoration(
                   border: Border.all(
                       color: const Color(0xffffffff),
                       width: 3
                   )
               )
           ),

           new Text('Berhasil Menambahkan Data',
             style: const TextStyle(
                 fontSize: 25.0,
                 color: Colors.white,
                 fontStyle:  FontStyle.normal,
                 fontWeight: FontWeight.w600,
                 fontFamily: "SFProText"
             ),),
           new Padding(padding: EdgeInsets.only(top: 38.0)),

           new Text('Data untuk hari ini telah terkirim, anda baru bisa menambahkan data lagi besok',
               style: const TextStyle(
                 fontSize: 15.0,
                 color: Colors.white,
                 fontStyle:  FontStyle.normal,
                   fontWeight: FontWeight.w600,
                   fontFamily: "SFProText"),textAlign: TextAlign.center,),
           new Padding(padding: EdgeInsets.only(top: 140.0)),

           new SizedBox(
             width: 319,
             height: 54,
             child:
             RaisedButton(
                 color: Colors.white,
                 shape: StadiumBorder(),
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child:   Text(
                     "KEMBALI",
                     style: const TextStyle(
                         color: Colors.green,
                         fontWeight: FontWeight.w600,
                         fontFamily: "SFProText",
                         fontStyle:  FontStyle.normal,
                         fontSize: 14.0
                     ),
                     textAlign: TextAlign.left
                 )),

           ),
         ],
       ),
      ),
    );
  }
}
