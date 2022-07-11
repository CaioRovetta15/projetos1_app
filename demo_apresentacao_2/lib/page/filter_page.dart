// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, unused_field, prefer_collection_literals, deprecated_member_use, unnecessary_null_comparison, prefer_conditional_assignment

import 'dart:core';

import 'package:demo_apresentacao_2/Access.dart';
import 'package:demo_apresentacao_2/constants/color.dart';
import 'package:flutter/material.dart';

int size = 0;
List<bool> filteredValues = List.generate(size, (index) => true);
//List<bool> filteredValues=setFilteredValues(size);
List<bool> setFilteredValues(int size) {
  if (filteredValues == null) {
    filteredValues = List<bool>.generate(size, (i) => true);
  }
  // for (int i = 0; i < size; i++) {
  //   //filteredValues.add(true);
  // }
  // }
  //print(size);
  //print(filteredValues);
  return filteredValues;
}

class Filter extends StatefulWidget {
  List<Access> acces;
  Filter({Key? key, required this.acces}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    size = widget.acces.length;
    //print(widget.acces.length);
    List<bool> _value = setFilteredValues(size);
    //List<bool>.filled(size, true);
    size = widget.acces.length;
    List<Container> filters = makeFilters(widget.acces, _value);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        backgroundColor: bgColor,
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        //width: 400,
        //height: 400,
        child: Center(
            child: ListView(
          children: filters,
          
        )),
      ),
    );
  }

  List<Container> makeFilters(List<Access> acces, List<bool> _value) {
    List<Container> filters = <Container>[];
    for (int i = 0; i < acces.length; i++) {
      filters.add(Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CheckboxListTile(
          title: Text(acces[i].operador.toString()),
          secondary: const Icon(Icons.calendar_month),
          activeColor: bgColor,
          checkColor: Colors.white,
          selected: _value[i],
          value: _value[i],
          onChanged: (bool? value) {
            setState(() {
              _value[i] = value!;
              filteredValues = _value;
            });
          },
        ),
      ));
    }
    filters.add(Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            //border: Border.all(color:pink),
            //borderRadius: BorderRadius.circular(10),
            ),
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context, filteredValues);
          },
          child: Text('Filtrar'),
          color: pink,
        )));

    return filters;
  }
}
