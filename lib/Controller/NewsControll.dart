import 'dart:convert';

import 'package:flutter_application_1/model/NewsModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

class NewsControll extends GetxController {
 RxInt CurrentIndex=0.obs;
Future<Artivcles?> getData(String Categories) async{
    var url = Uri.parse(
    "https://newsapi.org/v2/top-headlines?country=us&category=${Categories}&apiKey=7256db579fbb4e06ae81b61b50ca1fe6");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      try {
            return Artivcles.fromJson(
        jsonDecode(res.body)
        );
      } catch (ex) {
        Get.snackbar("erroe", ex.toString());
      }
    }
  }
}
