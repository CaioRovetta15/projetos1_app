// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _value1 = true;
  bool _value2 = true;
  bool _value3 = true;
  bool _value4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter'),
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
                  child: CheckboxListTile(
                    title: const Text('07/05/2022'),
                    secondary: const Icon(Icons.calendar_month),
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    selected: _value1,
                    value: _value1,
                    onChanged: (bool? value) {
                      setState(() {
                        _value1 = value!;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: const Text('08/05/2022'),
                    secondary: const Icon(Icons.calendar_month),
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    selected: _value2,
                    value: _value2,
                    onChanged: (bool? value) {
                      setState(() {
                        _value2 = value!;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: const Text('09/05/2022'),
                    secondary: const Icon(Icons.calendar_month),
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    selected: _value3,
                    value: _value3,
                    onChanged: (bool? value) {
                      setState(() {
                        _value3 = value!;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: const Text('10/05/2022'),
                    secondary: const Icon(Icons.calendar_month),
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    selected: _value4,
                    value: _value4,
                    onChanged: (bool? value) {
                      setState(() {
                        _value4 = value!;
                      });
                    },
                  ),
                ),
              ]),
            )));
  }
}
