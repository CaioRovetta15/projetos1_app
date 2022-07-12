// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, prefer_const_constructors,prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_local_variable

//import 'dart:html';
// import 'dart:convert';
// import 'dart:typed_data';

import 'package:demo_apresentacao_2/firebase/FireStorageService.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//import 'package:uuid/uuid.drt';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:demo_apresentacao_2/constants/color.dart';
// import 'package:demo_apresentacao_2/firebase/FireStorageService.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/Access.dart';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as Img;
import 'package:video_player/video_player.dart';

class accesDetail extends StatelessWidget {
  final Access access;
  final FirebaseStorage storageRef = FirebaseStorage.instance;

  accesDetail({Key? key, required this.access}) : super(key: key);
  Future<String> _getImage(BuildContext context, String imageName) async {
    String url = '';
    await FireStorageService.loadImage(context, imageName).then((value) {
      url = value.toString();
    });
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(access.operador),
        backgroundColor: bgColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FutureBuilder(
              future: _getImage(context, access.gifPath),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Image.network(snapshot.data.toString());
                } else {
                  return CircularProgressIndicator();
                }
              }),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                border: Border.all(
                  color: bgColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ' Operador:',
                      style: TextStyle(
                          fontSize: 18,
                          height:
                              1, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Color.fromARGB(255, 0, 0, 0), //font color
                          //backgroundColor: Colors.black12, //background color
                          letterSpacing: 1, //letter spacing
                          //decoration: TextDecoration.underline, //make underline
                          //decorationStyle: TextDecorationStyle.double, //double underline
                          //decorationColor: Colors.brown, //text decoration 'underline' color
                          //decorationThickness: 1.5, //decoration 'underline' thickness
                          fontStyle: FontStyle.italic),
                    )
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      access.operador,
                      style: TextStyle(
                          fontSize: 18,
                          height:
                              1, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Color.fromARGB(255, 0, 0, 0), //font color
                          //backgroundColor: Colors.black12, //background color
                          letterSpacing: 1, //letter spacing
                          //decoration: TextDecoration.underline, //make underline
                          //decorationStyle: TextDecorationStyle.double, //double underline
                          //decorationColor: Colors.brown, //text decoration 'underline' color
                          //decorationThickness: 1.5, //decoration 'underline' thickness
                          fontStyle: FontStyle.italic),
                    )
                  ])
            ]),
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                border: Border.all(
                  color: bgColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ' Medicamento:',
                      style: TextStyle(
                          fontSize: 18,
                          height:
                              1, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Color.fromARGB(255, 0, 0, 0), //font color
                          //backgroundColor: Colors.black12, //background color
                          letterSpacing: 1, //letter spacing
                          //decoration: TextDecoration.underline, //make underline
                          //decorationStyle: TextDecorationStyle.double, //double underline
                          //decorationColor: Colors.brown, //text decoration 'underline' color
                          //decorationThickness: 1.5, //decoration 'underline' thickness
                          fontStyle: FontStyle.italic),
                    )
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      access.medicamento,
                      style: TextStyle(
                          fontSize: 18,
                          height:
                              1, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Color.fromARGB(255, 0, 0, 0), //font color
                          //backgroundColor: Colors.black12, //background color
                          letterSpacing: 1, //letter spacing
                          //decoration: TextDecoration.underline, //make underline
                          //decorationStyle: TextDecorationStyle.double, //double underline
                          //decorationColor: Colors.brown, //text decoration 'underline' color
                          //decorationThickness: 1.5, //decoration 'underline' thickness
                          fontStyle: FontStyle.italic),
                    )
                  ]),
            ]),
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                border: Border.all(
                  color: bgColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ' Horário de Acesso:',
                      style: TextStyle(
                          fontSize: 18,
                          height:
                              1, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Color.fromARGB(255, 0, 0, 0), //font color
                          //backgroundColor: Colors.black12, //background color
                          letterSpacing: 1, //letter spacing
                          //decoration: TextDecoration.underline, //make underline
                          //decorationStyle: TextDecorationStyle.double, //double underline
                          //decorationColor: Colors.brown, //text decoration 'underline' color
                          //decorationThickness: 1.5, //decoration 'underline' thickness
                          fontStyle: FontStyle.italic),
                    )
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      access.horario.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          height:
                              1, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Color.fromARGB(255, 0, 0, 0), //font color
                          //backgroundColor: Colors.black12, //background color
                          letterSpacing: 1, //letter spacing
                          //decoration: TextDecoration.underline, //make underline
                          //decorationStyle: TextDecorationStyle.double, //double underline
                          //decorationColor: Colors.brown, //text decoration 'underline' color
                          //decorationThickness: 1.5, //decoration 'underline' thickness
                          fontStyle: FontStyle.italic),
                    )
                  ]),
            ]),
          ),
        ],
      ),
    );
  }
}
