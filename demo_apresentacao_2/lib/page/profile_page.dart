// ignore_for_file: prefer_const_constructors

import 'package:demo_apresentacao_2/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/page/login_controller.dart';
import 'package:get/get.dart';
import 'package:demo_apresentacao_2/page/login_page.dart';

class ProfilePage extends StatelessWidget {
  final LoginController controller;
  const ProfilePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile Page'),
          backgroundColor: bgColor,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CircleAvatar(
                backgroundImage: Image.network(
                        controller.googleAccount.value?.photoUrl ?? '')
                    .image,
                radius: 90,
              ),
              SizedBox(height: 20),
              Text(controller.googleAccount.value?.displayName ?? '',
                  style: Get.textTheme.headline6),
              SizedBox(height: 20),
              Text(controller.googleAccount.value?.email ?? '',
                  style: Get.textTheme.bodyText1),
              SizedBox(height: 20),
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
