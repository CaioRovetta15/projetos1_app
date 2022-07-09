//import 'dart:developer';
// ignore_for_file: avoid_print

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<String> loadImage(BuildContext context, String image) async {
    var ref = FirebaseStorage.instance.ref();
    var url = ref.child(image.substring(36)).getDownloadURL();
    return url;
  }
}
