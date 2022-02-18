import 'dart:convert';

import 'package:banknote/string_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppModel {
  Map<String, double> data;

  AppModel(this.data);

  Future<String> getPrediction(BuildContext context) async {
    var client = http.Client();



    var response = await client.post(StringUrl.uri,
        body: json.encode(data), headers: {'content-type': 'application/json'});

    String? predResult;

    try {
      if (response.statusCode == 200) {
        var result = json.decode(response.body);


        predResult = result['prediction'];
      
    }
    } catch (e) {
      print(e);


    }

    return predResult!;
  }
}
