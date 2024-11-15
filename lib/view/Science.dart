// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/NewsControll.dart';
import 'package:flutter_application_1/model/NewsModel.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Science extends StatelessWidget {
  Science({super.key});

  NewsControll newsCon = Get.put(NewsControll());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
        ),

      
        body: FutureBuilder<Artivcles?>(
          future: newsCon.getData("science"),
          builder: (context, AsyncSnapshot<Artivcles?> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              Artivcles? data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.articles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            if (data?.articles[index].urlToImage != null)
                              Image.network(data!.articles[index].urlToImage!),
                            if (data?.articles[index].title != null)
                              Text(
                                data!.articles[index].title!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            if (data?.articles[index].description != null)
                              Text(
                                " Description: ${data!.articles[index].description!},",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
