// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/Access.dart';

class accesDetail extends StatelessWidget {
  final Access access;

  const accesDetail({Key? key, required this.access}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(access.operador),
      ),
      body: Column(
       children: [
         /* Center(
            child: Image.network(AccesDataModel.ImageUrl),
          ),*/
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
