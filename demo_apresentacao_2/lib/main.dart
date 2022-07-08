// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, use_key_in_widget_constructors, unused_import

import 'package:demo_apresentacao_2/fire_page.dart';
import 'package:demo_apresentacao_2/requestAcess.dart';
import 'package:demo_apresentacao_2/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> accesname = [
    'Gaveta 1',
    'Gaveta 2',
    'Gaveta 3',
    'Gaveta 4',
    'Gaveta 5',
  ];

  /*static List url = [
    'https://media.giphy.com/media/xT5LMHyyxpXGZuX36o/giphy.gif',
    'https://media.giphy.com/media/nKhQFxAzduWpa/giphy.gif',
    'https://media.giphy.com/media/IhsPkVefNgHC07FsuV/giphy.gif',
    'https://media.giphy.com/media/l41m2bKUHww1kXHcA/giphy.gif',
    'https://media.giphy.com/media/l4FB4fs81wO8aUhTa/giphy.gif'
  ];*/

  /*final List<accesDataModel> accesdata = List.generate(
      accesname.length,
      (index) => accesDataModel('${accesname[index]}',)
      );*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de acessos'),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Histórico de acessos'),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  //child: Image.network(accesdata[index].ImageUrl),
                  
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FirePage()));
                },
              ),
            );
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
}*/
