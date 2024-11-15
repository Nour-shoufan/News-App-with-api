// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/NewsControll.dart';
import 'package:flutter_application_1/model/NewsModel.dart';
import 'package:flutter_application_1/view/Science.dart';
import 'package:flutter_application_1/view/home.dart';
import 'package:flutter_application_1/view/sports.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  Home({super.key});

  NewsControll newsCon = Get.put(NewsControll());
  List Pages = [
    homeNews(),
    Sports(),
     Science()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
      ),
      bottomNavigationBar:
      GetX<NewsControll>(builder: (controller) => BottomNavigationBar(
              currentIndex: newsCon.CurrentIndex.value,
              onTap: (val) {
                newsCon.CurrentIndex.value = val;
              },
              selectedItemColor: Colors.red,
              // selectedIconTheme: Colors.red,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "News"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: "Sports"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: "Scince"),
              ]),),
       


      body: GetX<NewsControll>(builder: (controller) => Pages[newsCon.CurrentIndex.value],),
    
    );
  }
}
