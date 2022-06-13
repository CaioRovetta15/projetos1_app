//import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    print(image);
    var referencia = FirebaseStorage.instance;
    var path = referencia
        .ref()
        .child('gs://smartcabinet-a190c.appspot.com/Gaveta1/kablogers.png');
    print(path.getDownloadURL().toString());
    //return await ref.getDownloadURL();

    final FirebaseStorage firebaseStorage =
        FirebaseStorage(FirebaseStorage.instance.app, image);

    return path
        .getDownloadURL()
        .toString(); // 'https://firebasestorage.googleapis.com/v0/b/smartcabinet-a190c.appspot.com/o/Gaveta1%2Fsuperheolanding.gif?alt=media&token=72eb9fef-b492-4885-a387-f5ec90af03aa';

    //return ';
  }

  //https://firebase.google.com/docs/storage/flutter/handle-errors

  // static Future<dynamic> getImage(String imageUrl) async {
  //   return FirebaseStorage.instance.refFromURL(imageUrl);
  // }
}
