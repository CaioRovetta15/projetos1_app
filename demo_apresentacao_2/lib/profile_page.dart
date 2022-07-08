// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/login_controller.dart';
import 'package:get/get.dart';
import 'package:demo_apresentacao_2/login_page.dart';

class ProfilePage extends StatelessWidget {
  final LoginController controller;
  const ProfilePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile Page'),
        ),
      body: Center(
        child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          CircleAvatar(
            backgroundImage:
                Image.network(controller.googleAccount.value?.photoUrl ?? '')
                    .image,
            radius: 50,
          ),
          Text(controller.googleAccount.value?.displayName ?? '',
              style: Get.textTheme.headline6),
          Text(controller.googleAccount.value?.email ?? '',
              style: Get.textTheme.bodyText1),
          ActionChip(
            label: Text('Logout'),
            avatar: Icon(Icons.logout),
            onPressed: () {
              controller.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ])));
  }
}
