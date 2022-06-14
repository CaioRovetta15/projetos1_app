//import 'dart:developer';
// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<String> loadImage(BuildContext context, String image) async {
    var referencia = FirebaseStorage.instance.ref();
    var url = referencia.child('/Gaveta1/dipirona.png').getDownloadURL();
    return url;
  }
}
