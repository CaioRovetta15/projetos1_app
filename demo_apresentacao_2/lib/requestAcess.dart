import 'package:flutter/material.dart';

class RequestAcess extends StatefulWidget {
  const RequestAcess({Key? key}) : super(key: key);

  @override
  State<RequestAcess> createState() => _RequestAcessState();
}

class _RequestAcessState extends State<RequestAcess> {

  int quant_paracetamol = 0;
  int quant_dipirona = 0;
  int quant_ibuprofeno = 0;
  int quant_nimesulida = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Selecione um remédio'),
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
                        onPressed: (){
                          setState(() {
                            quant_paracetamol--;
                          });
                    })]),
                    Column(children: <Widget>[Text(quant_paracetamol.toString())]),
                    Column(children: <Widget>[
                      TextButton(
                        child: Text('+'),
                        onPressed: (){
                          setState(() {
                            quant_paracetamol++;
                          });
                    })])
                 ])
                ),
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
                        onPressed: (){
                          setState(() {
                            quant_dipirona--;
                          });
                    })]),
                    Column(children: <Widget>[Text(quant_dipirona.toString())]),
                    Column(children: <Widget>[
                      TextButton(
                        child: Text('+'),
                        onPressed: (){
                          setState(() {
                            quant_dipirona++;
                          });
                    })])
                 ])
                ),
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
                        onPressed: (){
                          setState(() {
                            quant_ibuprofeno--;
                          });
                    })]),
                    Column(children: <Widget>[Text(quant_ibuprofeno.toString())]),
                    Column(children: <Widget>[
                      TextButton(
                        child: Text('+'),
                        onPressed: (){
                          setState(() {
                            quant_ibuprofeno++;
                          });
                    })])
                 ])
                ),
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
                        onPressed: (){
                          setState(() {
                            quant_nimesulida--;
                          });
                    })]),
                    Column(children: <Widget>[Text(quant_nimesulida.toString())]),
                    Column(children: <Widget>[
                      TextButton(
                        child: Text('+'),
                        onPressed: (){
                          setState(() {
                            quant_nimesulida++;
                          });
                    })])
                 ])
                ),
              ]),
            )));
  }
}