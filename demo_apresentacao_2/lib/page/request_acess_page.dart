// ignore_for_file: non_constant_identifier_names

import 'package:demo_apresentacao_2/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';


class RequestAcess extends StatefulWidget {
  const RequestAcess({Key? key}) : super(key: key);

  @override
  State<RequestAcess> createState() => _RequestAcessState();
}

class _RequestAcessState extends State<RequestAcess> {

  List<int> quantidades = [0,0,0,0];

  int gaveta_1 = 0;
  int gaveta_2 = 0;

  int sendRequest() {

    String medicamentos = medicamentosEnvio();
    int qual_gaveta = 0;
    List<String> send_quant = []; 

    if(gaveta_1==1 && gaveta_2==1) qual_gaveta = 2;
    else if(gaveta_1==1) qual_gaveta = 1;
    else if(gaveta_2==1) qual_gaveta = 1;
    else return 0;

    for(int i=0; i<quantidades.length; i++){
      send_quant.add('');
      if(quantidades[i]>0) send_quant[i] = quantidades[i].toString();
    }

    String concat_quant = send_quant.join(' ');
    var time = DateTime.now();
    String date = DateFormat("dd-MM-yyyy").format(time);

    FirebaseFirestore.instance.collection('Auxiliary').doc('Acess_Request').
        update({'Atualizador': true, 'Gaveta': qual_gaveta, 'Medicamento': medicamentos, 'Quantidades': concat_quant,
        'Hora': time.hour, 'Minutos': time.minute, 'Segundos': time.second, 'Data': date});

    return 0;
  }

  String medicamentosEnvio(){
    List<String> lista_medicamentos = [];

    if(quantidades[0]>0){
      lista_medicamentos.add('Paracetamol');
      gaveta_1 = 1;
    }
    if(quantidades[1]>0) {
      lista_medicamentos.add('Dipirona');
      gaveta_2 = 1;
    }
    if(quantidades[2]>0) {
      lista_medicamentos.add('Ibuprofeno');
      gaveta_2 = 1;
    }
    if(quantidades[3]>0) {
      lista_medicamentos.add('Nimesulida');
      gaveta_1 = 1;
    }

    return lista_medicamentos.join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Selecione um remédio'),
          backgroundColor: bgColor,
          actions: <Widget>[
              TextButton(
              onPressed: () {
                sendRequest();
              },
              child: Text("Enviar"),
            ),
          ],
        ),
        body: SizedBox(
            width: 400,
            height: 400,
            child: Center(
              child: Column(children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: <Widget>[
                      Column(children: <Widget>[Text('Paracetamol')]),
                      Spacer(),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('-'),
                            onPressed: () {
                              setState(() {
                                quantidades[0]--;
                              });
                            })
                      ]),
                      Column(children: <Widget>[
                        Text(quantidades[0].toString())
                      ]),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('+'),
                            onPressed: () {
                              setState(() {
                                quantidades[0]++;
                              });
                            })
                      ])
                    ])),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: <Widget>[
                      Column(children: <Widget>[Text('Dipirona')]),
                      Spacer(),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('-'),
                            onPressed: () {
                              setState(() {
                                quantidades[1]--;
                              });
                            })
                      ]),
                      Column(
                          children: <Widget>[Text(quantidades[1].toString())]),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('+'),
                            onPressed: () {
                              setState(() {
                                quantidades[1]++;
                              });
                            })
                      ])
                    ])),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: <Widget>[
                      Column(children: <Widget>[Text('Ibuprofeno')]),
                      Spacer(),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('-'),
                            onPressed: () {
                              setState(() {
                                quantidades[2]--;
                              });
                            })
                      ]),
                      Column(children: <Widget>[
                        Text(quantidades[2].toString())
                      ]),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('+'),
                            onPressed: () {
                              setState(() {
                                quantidades[2]++;
                              });
                            })
                      ])
                    ])),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: <Widget>[
                      Column(children: <Widget>[Text('Nimesulida')]),
                      Spacer(),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('-'),
                            onPressed: () {
                              setState(() {
                                quantidades[3]--;
                              });
                            })
                      ]),
                      Column(children: <Widget>[
                        Text(quantidades[3].toString())
                      ]),
                      Column(children: <Widget>[
                        TextButton(
                            child: Text('+'),
                            onPressed: () {
                              setState(() {
                                quantidades[3]++;
                              });
                            })
                      ])
                    ])),
              ]),
            )));
  }



}
