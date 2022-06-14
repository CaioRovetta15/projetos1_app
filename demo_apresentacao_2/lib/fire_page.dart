import 'dart:async';
//import 'dart:html';
//import 'dart:js_util';
import 'package:demo_apresentacao_2/Access.dart';
import 'package:demo_apresentacao_2/accesDetail.dart';
import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:demo_apresentacao_2/FireStorageService.dart';
import 'dart:io';

class FirePage extends StatefulWidget {
  const FirePage({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text('Histórico de acessos'),
      ),
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
        backgroundColor: Colors.blue,
      ),
    );
  }
}
