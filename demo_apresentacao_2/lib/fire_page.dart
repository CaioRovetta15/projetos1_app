import 'dart:async';
//import 'dart:js_util';

//import 'dart:html';

import 'package:demo_apresentacao_2/accesDataModel.dart';
import 'package:demo_apresentacao_2/accesDetail.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:demo_apresentacao_2/filter.dart';

class FirePage extends StatefulWidget {
  const FirePage({ Key? key }) : super(key: key);

  @override
  State<FirePage> createState() => _FirePageState();
}

class _FirePageState extends State<FirePage> {
  String name = 'void';
  int date = 0;
  int time = 0;

  List<accesDataModel> accesdata = [];

  late final DatabaseReference dataRef;
  late final DatabaseReference nameRef;
  late final DatabaseReference dateRef;
  late final DatabaseReference timeRef;
  late final StreamSubscription<DatabaseEvent> Subscription;

  @override
  void initState(){
    super.initState();
    init();
  }

  init() async{
    nameRef = FirebaseDatabase.instance.ref('operador');
    /*dateRef = FirebaseDatabase.instance.ref('data');
    timeRef = FirebaseDatabase.instance.ref('horario');*/

    try{
      final nameSnap = await nameRef.get();
      name = nameSnap.value as String;
      /*final dateSnap = await dateRef.get();
      date = dateSnap.value as int;
      final timeSnap = await timeRef.get();
      time = timeSnap.value as int;*/
    }
    catch(err){
      debugPrint(err.toString());
    }
  

  Subscription = nameRef.onValue.listen((DatabaseEvent event){
      setState(() {
        name = (event.snapshot.value ?? 'void') as String;
        accesdata.add(accesDataModel(name));
      });
    });
  }

  @override
  void dispose(){
    Subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historico de acessos'),
      ),
      body: ListView.builder(
          itemCount: accesdata.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(accesdata[index].name),
                //leading: SizedBox(
                //width: 50,
                //height: 50,
                //child: Image.network(accesdata[index].ImageUrl),                
                //),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => accesDetail(
                            AccesDataModel: accesdata[index],
                          )));
                },
              ));
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