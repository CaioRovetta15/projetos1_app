// ignore_for_file: prefer_const_constructors

import 'dart:async';
//import 'dart:html';
//import 'dart:js_util';
import 'package:demo_apresentacao_2/Access.dart';
import 'package:demo_apresentacao_2/constants/color.dart';
import 'package:demo_apresentacao_2/page/acces_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/filter.dart';
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

  Stream<List<Access>> readGavetas() => FirebaseFirestore.instance
      .collection('Gaveta')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Access.fromJson(doc.data())).toList());

  @override
  void initState() {
    super.initState();
    readGavetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ignore: prefer_const_literals_to_create_immutables
      appBar: AppBar(
          title: Text('Histórico de acessos'),
          backgroundColor: bgColor,
          actions: [
            // PopupMenuButton(
            //   onSelected: (value) {
            //     if (value == 'perfil') {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProfilePage(
            //                 controller: widget.controller,
            //               )));
            //     }
            //     if (value == 'retirada') {
            //       Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context) => RequestAcess()));
            //     }
            //   },
            //   itemBuilder: (context) => [
            //     PopupMenuItem(
            //       child: Text('Perfil'),
            //       value: 'perfil',
            //     ),
            //     PopupMenuItem(child: Text('Fazer Retirada'), value: 'retirada'),
            //   ],
            // )
          ]),
      body: StreamBuilder<List<Access>>(
          stream: readGavetas(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              final access = snapshot.data!;
              return ListView.builder(
                  itemCount: access.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(access[index].operador),
                      //leading: SizedBox(
                      //width: 50,
                      //height: 50,
                      //child: Image.network(accesdata[index].ImageUrl),
                      //),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                accesDetail(access: access[index])));
                      },
                    ));
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Filter()))
        },
        child: Icon(Icons.filter_list),
        backgroundColor: Color.fromRGBO(237, 191, 198, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
