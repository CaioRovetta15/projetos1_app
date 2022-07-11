// ignore_for_file: prefer_const_constructors

import 'dart:async';
//import 'dart:html';
//import 'dart:js_util';
import 'package:demo_apresentacao_2/Access.dart';
import 'package:demo_apresentacao_2/constants/color.dart';
import 'package:demo_apresentacao_2/page/acces_detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/page/filter_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:demo_apresentacao_2/firebase/FireStorageService.dart';
import 'dart:io';
import 'package:demo_apresentacao_2/page/login_controller.dart';
import 'package:demo_apresentacao_2/page/profile_page.dart';
import 'package:demo_apresentacao_2/page/request_acess_page.dart';

class FirePage extends StatefulWidget {
  final LoginController controller;

  const FirePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<FirePage> createState() => _FirePageState();
}

class _FirePageState extends State<FirePage> {
  final storageRef = FirebaseStorage.instance.ref();
  late final String imageUrl;

  Stream<List<Access>> readGavetas() {
    var result = FirebaseFirestore.instance
        .collection('Gaveta')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Access.fromJson(doc.data())).toList());
    return result;
  }

  Future<List<bool>> filtro(BuildContext context, List<Access> access) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Filter(
              acces: access,
            )));
    print(result);

    if (result != null) {
      print(result.toString() + "filtro");

      return result;
    } else {
      return [];
    }
  }

  List<Access> aplyFilter(List<Access> access, List<bool> filter) {
    print('tamanho do filtro ' + access.length.toString());
    if (filter.isEmpty) {
      return access;
    }
    List<Access> filteredAccess = access;
    for (int i = 0; i < access.length; i++) {
      //print(filteredAccess[i].operador);
      //print(filter[i]);
      // print(i);
      if (filter[i] == false) {
        Access empty = Access(filteredAccess[i].horario, "None",
            filteredAccess[i].medicamento, filteredAccess[i].gifPath);
        filteredAccess[i] = empty;
      }
      //print(filteredAccess[i].operador);
      // print(filter[i]);
      // print(i);
    }
    for (int i = 0; i < access.length; i++) {
      if (filteredAccess[i].operador == "None") {
        filteredAccess.removeAt(i);
      }
    }
    // print("filtered"+filteredAccess.().toString());
    return filteredAccess;
  }

  @override
  void initState() {
    super.initState();
    readGavetas();
  }

  List<Access> access = <Access>[];
  List<bool> filter = <bool>[];

  @override
  Widget build(BuildContext context) {
    List<Access> filteredAccess = aplyFilter(access, filter);

    return Scaffold(
      backgroundColor: Colors.white,

      // ignore: prefer_const_literals_to_create_immutables
      appBar: AppBar(
        title: Text('Histórico de acessos'),
        backgroundColor: bgColor,
      ),
      body: StreamBuilder<List<Access>>(
        stream: readGavetas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            access = snapshot.data!;
            //filteredAccess = aplyFilter(access, filter);
            return ListView.builder(
                itemCount: filteredAccess.length,
                itemBuilder: (context, index) {
                  if (filteredAccess[index].operador == "None") {
                    return Container();
                  }
                  return Card(
                      child: ListTile(
                    title: Text(filteredAccess[index].operador),
                    //leading: SizedBox(
                    //width: 50,
                    //height: 50,
                    //child: Image.network(accesdata[index].ImageUrl),
                    //),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              accesDetail(access: filteredAccess[index])));
                    },
                  ));
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          filter = await filtro(context, access);
          setState(() {});
        },
        child: Icon(Icons.filter_list),
        backgroundColor: Color.fromRGBO(237, 191, 198, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
