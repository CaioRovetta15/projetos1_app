// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:demo_apresentacao_2/constants/color.dart';
import 'package:demo_apresentacao_2/page/admin_page.dart';
import 'package:demo_apresentacao_2/page/home_page.dart';
import 'package:demo_apresentacao_2/page/login_controller.dart';
import 'package:demo_apresentacao_2/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/page/fire_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null) {
            return buildLoginScreen();
          } else if (controller.googleAccount.value?.email ==
              "caiorovetta123@usp.br") {
            return HomePageAdm(
              controller: controller,
            );
          } else{
            return HomePageUser(
              controller: controller,
            );
          }
          // if(controller.googleAccount.value == isAdm) {
          //   return AdmApp();
          // }
          // else {
          //    return UserApp();
          // }
        }),
      ),
    );
  }

  Column buildProfileView() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        backgroundImage:
            Image.network(controller.googleAccount.value?.photoUrl ?? '').image,
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
        },
      ),
    ]);
  }

  Scaffold buildLoginScreen() {
    return Scaffold(

        // appBar: AppBar(
        //   title: Text('Login Page'),
        //   backgroundColor: bgColor,
        // ),
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Text('Login Page', style: Get.textTheme.headline6),
        Image.asset(
          'assets/images/premier_logo.png',
        ),
        FloatingActionButton.extended(
          onPressed: () {
            controller.login();
          },
          icon: Image.asset('assets/images/google_logo.png',
              height: 30, width: 30, fit: BoxFit.contain),
          label: Text('Login Com Google'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        )
      ],
    )));
  }
}
