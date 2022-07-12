// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:demo_apresentacao_2/page/fire_page.dart';
import 'package:demo_apresentacao_2/page/profile_page.dart';
import 'package:demo_apresentacao_2/page/request_acess_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_apresentacao_2/constants/color.dart';
import 'package:demo_apresentacao_2/constants/text_style.dart';
import 'package:demo_apresentacao_2/data/modelUser.dart';
import 'package:demo_apresentacao_2/widgets/custom_paint.dart';
import 'package:demo_apresentacao_2/page/login_controller.dart';

class HomePageUser extends StatefulWidget {
  final LoginController controller;
  const HomePageUser({Key? key, required this.controller}) : super(key: key);

  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  int selectBtn = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SelectedPage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: navigationBar(),
          ),
        ],
      ),
    );
  }

  Align SelectedPage() {
    var page;
    if (selectBtn == 0) {
      page = RequestAcess();
    } else {
      page = ProfilePage(
        controller: widget.controller,
      );
    }
    return Align(alignment: Alignment.center, child: page);
  }

  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      height: 70.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 237, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
          topRight:
              Radius.circular(selectBtn == navBtn.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            GestureDetector(
              onTap: () {
                setState(() => selectBtn = i);
              },
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;
    var height = isActive ? 60.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              navBtn[i].imagePath,
              color: isActive ? selectColor : black,
              scale: 2,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              navBtn[i].name,
              style: isActive ? bntText.copyWith(color: selectColor) : bntText,
            ),
          )
        ],
      ),
    );
  }
}
