// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, prefer_const_constructors
import 'dart:developer';
import 'dart:io';
import 'package:demo_apresentacao_2/FireStorageService.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/Access.dart';

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
    //return 'https://firebasestorage.googleapis.com/v0/b/smartcabinet-a190c.appspot.com/o/Gaveta1%2Fsuperheolanding.gif?alt=media&token=72eb9fef-b492-4885-a387-f5ec90af03aa';
  }

  @override
  Widget build(BuildContext context) {
    stdout.writeln("build: here");
    return Scaffold(
      appBar: AppBar(
        title: Text(access.operador),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: _getImage(context, access.gifPath),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  stdout.writeln("FutureBuilder: here");
                  return Image.network(snapshot.data.toString());
                  //fit:Boxfit.fill;
                } else {
                  return CircularProgressIndicator();
                }
              }),
          SizedBox(
            height: 10,
          ),
          Text(
            access.horario.toString() + "\n" + access.medicamento,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
